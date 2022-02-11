module "cdn" {
  source = "../.."

  # Cdn
  add_cdn_domain = true

  domain_name = "168.com"
  cdn_type    = "web"
  scope       = "domestic"
  sources     = var.sources
  tags        = var.tags

  # Cdn_config
  set_config = false

}

module "cdn_config" {
  source = "../.."

  # Cdn
  add_cdn_domain = false

  # Cdn_config
  set_config = true

  existing_domain_names = [module.cdn.this_cdn_domain_name]
  function_name         = "ip_allow_list_set"
  function_arg          = var.function_arg

}