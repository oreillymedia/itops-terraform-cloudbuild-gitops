<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 3.86.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 2.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.86.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.adam-vm](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/resources/compute_instance) | resource |
| [google_compute_image.itops_base_image](https://registry.terraform.io/providers/hashicorp/google/3.86.0/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The size of the boot disk in GB | `string` | n/a | yes |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Logging configuration | `bool` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment name | `string` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type to be used | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the project | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name of the env | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone where resources are deployed | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->