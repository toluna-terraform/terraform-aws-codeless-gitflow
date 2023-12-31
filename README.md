# terraform-aws-s3-pipeline
.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ci-cd-code-pipeline"></a> [ci-cd-code-pipeline](#module\_ci-cd-code-pipeline) | ./modules/ci-cd-codepipeline | n/a |
| <a name="module_test"></a> [test](#module\_test) | ./modules/test | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_ssm_parameter.ado_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.ado_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_env_type"></a> [env\_type](#input\_env\_type) | n/a | `string` | n/a | yes |
| <a name="input_from_env"></a> [from\_env](#input\_from\_env) | n/a | `string` | n/a | yes |
| <a name="input_pipeline_type"></a> [pipeline\_type](#input\_pipeline\_type) | n/a | `string` | n/a | yes |
| <a name="input_run_integration_tests"></a> [run\_integration\_tests](#input\_run\_integration\_tests) | n/a | `bool` | `false` | no |
| <a name="input_source_repository"></a> [source\_repository](#input\_source\_repository) | n/a | `string` | n/a | yes |
| <a name="input_src_bucket"></a> [src\_bucket](#input\_src\_bucket) | n/a | `any` | n/a | yes |
| <a name="input_termination_wait_time_in_minutes"></a> [termination\_wait\_time\_in\_minutes](#input\_termination\_wait\_time\_in\_minutes) | n/a | `number` | `120` | no |
``                                                                                          |    no    |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
