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

variable "gcp_project_region" {
  type        = string
  description = "Region to deploy GCP resources to"
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

variable "kms_key_name" {
  type        = string
  default     = ""
  description = "The name of the customer provided KMS key"
}

variable "storage_bucket_access_logs_bucket" {
  type        = string
  default     = ""
  description = "Name of the storage bucket to store storage bucket access logs in"
}
