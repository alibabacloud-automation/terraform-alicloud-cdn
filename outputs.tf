output "this_cdn_domain_name" {
  description = "The name of cdn domain."
  value       = concat(alicloud_cdn_domain_new.this.*.domain_name, [""])[0]
}

output "this_cdn_domain_id" {
  description = "The id of cdn domain."
  value       = concat(alicloud_cdn_domain_new.this.*.id, [""])[0]
}

output "this_cdn_sources" {
  description = "The source address list of the cdn domain"
  value       = concat(alicloud_cdn_domain_new.this.*.sources, [""])[0]
}

output "this_cdn_domain_config_function_name" {
  description = "The name of the domain config."
  value       = concat(alicloud_cdn_domain_config.this.*.function_name, [""])[0]
}

output "this_cdn_config_function_id" {
  description = "The id of the domain config."
  value       = concat(alicloud_cdn_domain_config.this.*.id, [""])[0]
}

output "this_cdn_config_function_args" {
  description = "The args of the domain config."
  value       = concat(alicloud_cdn_domain_config.this.*.function_args, [""])[0]
}