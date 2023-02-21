variable "name" {
  type        = string
  description = "Name of the event handler application"
}

variable "owner" {
  type        = string
  description = "Owner of the event handler resources"
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

variable "function_location" {
  type        = string
  description = "Location for the cloudfunctions2 function"
}

variable "handler_secrets" {
  type        = list(any)
  default     = []
  description = "List of secrets from gcp secrets manager to include in the cloudfunction function"
}
