# alicloud_cdn

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain_name | The name of a new cdn domain | string | no | yes |
| type | The is cdn business type | string | web | yes |
| origin_type | The type origin type | string | domain | yes |
| origin_port | The type origin port | string | 80 | yes |
| origins     | The origin instanes | list | no | yes |


## Outputs

| Name | Description |
|------|-------------|
| domain |  |
