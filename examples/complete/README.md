# CDN example

Configuration in this directory creates CDN, and batch configuration of CDN.


# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs
| Name | Description |
|------|-------------|
| this_cdn_domain_name | The name of cdn domain |
| this_cdn_domain_id | The id of cdn domain |
| this_cdn_sources | The source address list of the cdn domain |
| this_cdn_domain_config_function_name | The name of the domain config |
| this_cdn_config_function_id | The id of the domain config |
| this_cdn_config_function_args | The args of the domain config |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
