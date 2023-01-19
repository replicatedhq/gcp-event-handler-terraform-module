## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.11 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | ~> 2.2.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.47.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | ~> 2.2.0 |
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.47.0 |
| <a name="provider_null"></a> [null](#provider\_null) | ~> 3.1.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloudfunctions_function.handler_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function) | resource |
| [google_pubsub_schema.event_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_schema) | resource |
| [google_pubsub_subscription.event_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_topic.event_topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |
| [google_storage_bucket.handler_storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.handler_object](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [null_resource.trigger](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [archive_file.handler_function_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_schema"></a> [event\_schema](#input\_event\_schema) | AVRO formatted event schema for google pubsub topic | `string` | n/a | yes |
| <a name="input_handler_entrypoint"></a> [handler\_entrypoint](#input\_handler\_entrypoint) | entrypoint for the handler function | `string` | n/a | yes |
| <a name="input_handler_path"></a> [handler\_path](#input\_handler\_path) | Path to script that will be stored in a storage bucket and deployed to Cloud Functions | `string` | n/a | yes |
| <a name="input_handler_runtime"></a> [handler\_runtime](#input\_handler\_runtime) | Runtime used in handler function | `string` | n/a | yes |
| <a name="input_kms_key_name"></a> [kms\_key\_name](#input\_kms\_key\_name) | The name of the customer provided KMS key | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the event handler application | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of the event handler resources | `string` | n/a | yes |
| <a name="input_schema_encoding"></a> [schema\_encoding](#input\_schema\_encoding) | Encoding pubsub should expect from events | `string` | n/a | yes |
| <a name="input_storage_bucket_access_logs_bucket"></a> [storage\_bucket\_access\_logs\_bucket](#input\_storage\_bucket\_access\_logs\_bucket) | Name of the storage bucket to store storage bucket access logs in | `string` | `""` | no |

## Outputs

No outputs.
