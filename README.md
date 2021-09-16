Terraform module which create CDN domain on Alibaba Cloud.  
terraform-alicloud-cdn-domain
=============================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-cdn/blob/master/README-CN.md)

Terraform module which add new cdn domain on Alibaba Cloud and batch configuration for it.

These types of resources are supported:

* [cdn_domain_new](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain_new.html)
* [cdn_domain_config](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain_config.html)

## Terraform versions

The Module requires Terraform 0.12 and Terraform Provider AliCloud 1.67.0+.

## Usage

Create a new cdn domain and setting no cdn domain config.

```hcl
module "cdn" {
  source      = "terraform-alicloud-modules/cdn/alicloud"
  domain_name = "terraform.test.com"
  cdn_type    = "web"
  scope       = "overseas"
  sources = [
    {
      content  = "1.1.1.1"
      type     = "ipaddr"
      port     = 80
      priority = 20
      weight   = 10
    }
  ]
  add_config = false
}
```

Create a new cdn domain and set cdn domain config.

```hcl
module "cdn" {
  source      = "terraform-alicloud-modules/cdn/alicloud"
  domain_name = "terraform.test.com"
  cdn_type    = "web"
  scope       = "overseas"
  sources = [
    {
      content  = "1.1.1.1"
      type     = "ipaddr"
      port     = 80
      priority = 20
      weight   = 10
    }
  ]
  function_name          = "filetype_based_ttl_set"
  function_arg = [
    {
      arg_name  = "ttl"
      arg_value = "10"
    },
    {
      arg_name  = "file_type"
      arg_value = "txt,jpg"
    },
    {
      arg_name  = "weight"
      arg_value = "20"
    }
  ]
}
```

No new cdn domain created and batch set cdn config.

```hcl
module "cdn" {
  source                 = "terraform-alicloud-modules/cdn/alicloud"
  create_cdn_domain      = false
  add_config_domain_name = ["terraform.test.com", "terraform001.test.com"]
  function_name          = "filetype_based_ttl_set"
  function_arg = [
    {
      arg_name  = "ttl"
      arg_value = "10"
    },
    {
      arg_name  = "file_type"
      arg_value = "txt,jpg"
    },
    {
      arg_name  = "weight"
      arg_value = "20"
    }
  ]
}
```

Create a new cdn domain and batch set cdn config(contains the new cdn domain).

```hcl
module "cdn" {
  source      = "terraform-alicloud-modules/cdn/alicloud"
  domain_name = "terraform.test.com"
  cdn_type    = "web"
  scope       = "overseas"
  sources = [
    {
      content  = "1.1.1.1"
      type     = "ipaddr"
      port     = 80
      priority = 20
      weight   = 10
    }
  ]
  add_config_domain_name = ["terraform001.test.com", "terraform002.test.com"]
  function_name          = "filetype_based_ttl_set"
  function_arg = [
    {
      arg_name  = "ttl"
      arg_value = "10"
    },
    {
      arg_name  = "file_type"
      arg_value = "txt,jpg"
    },
    {
      arg_name  = "weight"
      arg_value = "20"
    }
  ]
}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-cdn/tree/master/examples/complete)


Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
