resource "google_pubsub_schema" "event_schema" {
  name       = "event_schema_${var.name}"
  type       = "AVRO"
  definition = var.event_schema
}

resource "google_pubsub_topic" "event_topic" {
  name         = "event_topic_${var.name}"
  kms_key_name = var.kms_enabled == true ? var.kms_key_name : null

  schema_settings {
    schema   = google_pubsub_schema.event_schema.id
    encoding = var.schema_encoding
  }

  labels = {
    owner      = var.owner
    managed-by = "terraform"
  }

  depends_on = [google_pubsub_schema.event_schema]
}

resource "google_pubsub_subscription" "event_subscription" {
  name  = "event_subscription_${var.name}"
  topic = google_pubsub_topic.event_topic.name

  depends_on = [google_pubsub_topic.event_topic]

  push_config {
    push_endpoint = google_cloudfunctions_function.handler_function.https_trigger_url
  }
}

resource "google_storage_bucket" "handler_bucket" {
  name                        = "handler_storage_bucket-${var.name}"
  location                    = "US"
  uniform_bucket_level_access = true
  logging {
    log_bucket = var.bucket_access_logging_enabled == true ? var.storage_bucket_access_logs_bucket : null
  }

  versioning = {
    enabled = true
  }

  labels = {
    owner      = var.owner
    managed-by = "terraform"
  }
}

resource "google_storage_bucket_object" "handler_object" {
  name         = "handler_bucket_object-${var.name}"
  bucket       = google_storage_bucket.handler_bucket.name
  source       = data.archive_file.handler_function_zip.output_path
  content_type = "application/zip"
  depends_on   = [google_storage_bucket.handler_storage_bucket]
}

resource "google_cloudfunctions_function" "handler_function" {
  name                  = "handler_function-${var.name}"
  runtime               = var.handler_runtime
  entry_point           = var.handler_entrypoint
  trigger_http          = true
  source_archive_bucket = google_storage_bucket.handler_bucket.name
  source_archive_object = google_storage_bucket_object.handler_object.name

  labels = {
    owner      = var.owner
    managed-by = "terraform"
  }
}

data "archive_file" "handler_function_zip" {
  type        = "zip"
  source_dir  = "${path.root}${var.handler_path}"
  ouptut_path = "${path.module}/tmp/handler_function.zip"
}
