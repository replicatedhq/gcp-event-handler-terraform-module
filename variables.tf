variable "name" {
  type        = string
  description = "Name of the event handler application"
}

variable "owner" {
  type        = string
  description = "Owner of the event handler resources"
}

variable "event_schema" {
  type        = string
  description = "AVRO formatted event schema for google pubsub topic"
}

variable "schema_encoding" {
  type        = string
  description = "Encoding pubsub should expect from events"
}

variable "gcp_project_id" {
  type        = string
  description = "ID for the GCP project to deploy resources to"
}

variable "handler_path" {
  type        = string
  description = "Path to script that will be stored in a storage bucket and deployed to Cloud Functions"
}

variable "handler_runtime" {
  type        = string
  description = "Runtime used in handler function"
}

variable "handler_entrypoint" {
  type        = string
  description = "entrypoint for the handler function"
}

variable "kms_enabled" {
  type        = bool
  default     = false
  description = "Whether or not a custom kms key will be used to encrypt the pubsub topic"
}

variable "kms_key_name" {
  type        = string
  description = "The name of the customer provided KMS key"
}

variable "bucket_access_logging_enabled" {
  type        = bool
  default     = false
  description = "Whether or not to store storage bucket access logs in a storage bucket"
}

variable "storage_bucket_access_logs_bucket" {
  type        = string
  description = "Name of the storage bucket to store storage bucket access logs in"
}
