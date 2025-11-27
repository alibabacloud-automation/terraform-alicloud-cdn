terraform-alicloud-cdn
======================

Terraform模块用于在阿里云上添加新的 cdn 域名和为其进行批量配置。

支持以下类型的资源：

* [cdn_domain_new](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain_new.html)
* [cdn_domain_config](https://www.terraform.io/docs/providers/alicloud/r/cdn_domain_config.html)

## 用法

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Acdn&spm=docs.m.terraform-alicloud-modules.cdn" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

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

## 注意事项
本Module从版本v1.4.0开始已经移除掉如下的 provider 的显式设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/cdn"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.3.0:

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

如果你想对正在使用中的Module升级到 1.4.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
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
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

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

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.67.0 |

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