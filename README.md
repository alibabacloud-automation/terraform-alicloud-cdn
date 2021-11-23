Terraform module which create CDN domain on Alibaba Cloud.  
terraform-alicloud-cdn-domain
=============================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-cdn/blob/master/README-CN.md)

Terraform module which add new cdn domain on Alibaba Cloud and batch configuration for it.

These types of resources are supported:

* [cdn_domain_new](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain_new.html)
* [cdn_domain_config](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain_config.html)

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

## Notes
From the version v1.4.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/cdn"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.3.0:

```hcl
module "cdn" {
  source      = "terraform-alicloud-modules/cdn/alicloud"
  version     = "1.3.0"
  region      = "cn-hangzhou"
  profile     = "Your-Profile-Name"
  domain_name = "terraform.test.com"
  cdn_type    = "web"
  // ...
}
```

If you want to upgrade the module to 1.4.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
}
module "cdn" {
  source      = "terraform-alicloud-modules/cdn/alicloud"
  domain_name = "terraform.test.com"
  cdn_type    = "web"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
  alias   = "hz"
}
module "cdn" {
  source      = "terraform-alicloud-modules/cdn/alicloud"
  providers   = {
    alicloud = alicloud.hz
  }
  domain_name = "terraform.test.com"
  cdn_type    = "web"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.67.0 |

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
