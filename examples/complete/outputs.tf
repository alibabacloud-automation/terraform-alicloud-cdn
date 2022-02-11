output "this_cdn_domain_name" {
  description = "The name of cdn domain."
  value       = module.cdn.this_cdn_domain_name
}

output "this_cdn_domain_id" {
  description = "The id of cdn domain."
  value       = module.cdn.this_cdn_domain_id
}

output "this_cdn_sources" {
  description = "The source address list of the cdn domain."
  value       = module.cdn.this_cdn_sources
}

output "this_cdn_domain_config_function_name" {
  description = "The name of the domain config."
  value       = module.cdn_config.this_cdn_domain_config_function_name
}

output "this_cdn_config_function_id" {
  description = "The id of the domain config."
  value       = module.cdn_config.this_cdn_config_function_id
}

output "this_cdn_config_function_args" {
  description = "The args of the domain config."
  value       = module.cdn_config.this_cdn_config_function_args
}