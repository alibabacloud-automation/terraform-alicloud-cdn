output "domain" {
  value = module.cdn.domain
}

output "this_domain_name" {
  value = module.cdn.domain_name
}

output "this_type" {
  value = module.cdn.type
}

output "this_origin_type" {
  value = module.cdn.source_type
}

output "this_origins" {
  value = module.cdn.sources
}
