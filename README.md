Alicloud Load Balancer (CDN) Terraform Module
=============================================

Terraform module which creates CDN resources on Alibaba Cloud.

These types of resources are supported:

* [CDN](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain.html)

Root module calls these modules which can also be used separately to create independent resources:

* [cdn](https://github.com/alibaba/terraform-alicloud-cdn/tree/master/modules/cdn) - create cdn domain


`NOTE`:

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf


         module "cdn" {

         }

2. Setting values for the following variables through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY


Authors
-------
Created and maintained by linxiao.jz(@linxiao.jz linxiao.jz@taobao.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
