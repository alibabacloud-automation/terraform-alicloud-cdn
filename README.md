Alicloud CDN Terraform Module
terraform-alicloud-cdn-domain
=============================================

Terraform module which creates CDN resources on Alibaba Cloud.

These types of resources are supported:

* [CDN](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain.html)

Root module calls these modules which can also be used separately to create independent resources:

* [cdn](https://github.com/alibaba/terraform-alicloud-cdn/tree/master/modules/cdn) - create cdn domain



Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf


         module "cdn" {
            source = "terraform-alicloud-modules/cdn-domain/alicloud"

            domain_name = "${var.domain_name}"
            type    = "${var.type}"

            origin_type = "${var.origin_type}"
            origins     = "${var.origins}"
         }

2. Setting values for the following variables through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY


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
| domain | The is domain name |

Authors
-------
Created and maintained by linxiao.jz(@linxiao.jz linxiao.jz@taobao.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
