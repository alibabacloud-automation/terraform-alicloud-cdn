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
| domain_name | The CDN domain name. Wildcard domain names that start with periods (.) are supported. For example, .a.com. | string | no | yes |
| type |The business type. Valid values: web, download, video, livestream, and httpsdelivery | string | web | yes |
| origin_type | The type of the origin. Ipaddr: The origin is configured using an IP address. Domain: The origin is configured using a domain name. Oss: The origin is configured using the Internet domain name of Alibaba Cloud OSS bucket. | string | domain | yes |
| origin_port | Valid values: 443 and 80. Default value: 80. Port 443 is used for HTTPS requests. Customized ports are supported. | string | 80 | yes |
| origins     | The origin instanes | list | no | yes |


## Outputs
| Name | Description |
|------|-------------|
| domain | The CDN domain name |

Authors
-------
Created and maintained by linxiao.jz(@linxiao.jz linxiao.jz@taobao.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
