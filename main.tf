# Resource to force archiving of file during apply step
resource "null_resource" "trigger" {
  triggers = {
    timestamp = timestamp()
  }
}

data "archive_file" "handler_function_zip" {
  type        = "zip"
  source_dir  = var.handler_path
  output_path = "${path.root}/handler_function.zip"

  depends_on = [resource.null_resource.trigger]
}

resource "google_pubsub_topic" "event_topic" {
  name         = "event-topic-${var.name}"
  kms_key_name = var.kms_key_name == "" ? null : var.kms_key_name

  labels = {
    owner      = var.owner
    managed-by = "terraform"
  }

}

resource "google_storage_bucket" "handler_storage_bucket" {
  name                        = "${var.name}-${var.gcp_account_id}-bucket"
  location                    = "US"
  uniform_bucket_level_access = true

  dynamic "logging" {
    for_each = var.storage_bucket_access_logs_bucket != null ? toset([1]) : toset([])

    content {
      log_bucket = var.storage_bucket_access_logs_bucket
    }
  }

  versioning {
    enabled = true
  }

  labels = {
    owner      = var.owner
    managed-by = "terraform"
  }
}

resource "google_storage_bucket_object" "handler_object" {
  name         = "handler-storage-bucket-object-${var.name}"
  bucket       = google_storage_bucket.handler_storage_bucket.name
  source       = data.archive_file.handler_function_zip.output_path
  content_type = "application/zip"
  depends_on   = [google_storage_bucket.handler_storage_bucket]
}

resource "google_service_account" "svc_account" {
  account_id   = var.gcp_account_id
  display_name = "event-handler-svc-account"
}

resource "google_project_iam_member" "svc_account_role_bind" {
  project = var.gcp_account_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.svc_account.email}"
}

resource "google_cloudfunctions2_function" "handler_function" {
  name     = "handler-function-${var.name}"
  location = var.function_location

  build_config {
    runtime     = var.handler_runtime
    entry_point = var.handler_entrypoint
    source {
      storage_source {
        bucket = google_storage_bucket.handler_storage_bucket.name
        object = google_storage_bucket_object.handler_object.name
      }
    }
  }

  event_trigger {
    event_type   = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic = google_pubsub_topic.event_topic.id
  }

  service_config {
    service_account_email = google_service_account.svc_account.email
  }

  labels = {
    owner      = var.owner
    managed-by = "terraform"
  }
}
