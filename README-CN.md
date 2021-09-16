terraform-alicloud-cdn
======================

Terraform模块用于在阿里云上添加新的 cdn 域名和为其进行批量配置。

支持以下类型的资源：

* [cdn_domain_new](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain_new.html)
* [cdn_domain_config](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain_config.html)

## Terraform 版本

本 Module 要求使用 Terraform 0.12 和 阿里云 Provider 1.67.0+。

## 用法

创建一个新的 cdn 域名，不进行域名配置。

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

创建一个新的 cdn 域名并进行域名配置。

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

不创建新的 cdn 域名，对已存在的 cdn 域名进行批量配置。

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

创建一个新的 cdn 域名，并进行 cdn 域名的批量配置（包含新创建的 cdn 域名）。

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

## 示例

* [CDN 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-cdn/tree/master/examples/complete)

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
