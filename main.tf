#####################
# Cdn
#####################
resource "alicloud_cdn_domain_new" "this" {
  count       = var.add_cdn_domain ? 1 : 0
  domain_name = var.domain_name
  cdn_type    = var.cdn_type
  scope       = var.scope
  sources {
    content  = lookup(var.sources[count.index], "content")
    type     = lookup(var.sources[count.index], "type", "ipaddr")
    port     = lookup(var.sources[count.index], "port", 80)
    priority = lookup(var.sources[count.index], "priority", 20)
    weight   = lookup(var.sources[count.index], "weight", 10)
  }
  tags = merge({
    Name = var.domain_name
    }, var.tags
  )
}

#####################
# Cdn_config
#####################
locals {
  domain_name = var.add_cdn_domain && var.set_config ? flatten([var.existing_domain_names, concat(alicloud_cdn_domain_new.this.*.domain_name, [""])[0]]) : var.existing_domain_names
  add_config  = length(local.domain_name) > 0 ? var.set_config : false
}

resource "alicloud_cdn_domain_config" "this" {
  count         = local.add_config ? length(local.domain_name) : 0
  domain_name   = local.domain_name[count.index]
  function_name = var.function_name

  dynamic "function_args" {
    for_each = var.function_arg
    content {
      arg_name  = lookup(function_args.value, "arg_name", null)
      arg_value = lookup(function_args.value, "arg_value", null)
    }
  }
}