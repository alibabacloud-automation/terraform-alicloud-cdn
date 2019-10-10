output "domain" {
  value = alicloud_cdn_domain.domain.id
}

output "domain_name" {
  value = alicloud_cdn_domain.domain.domain_name
}

output "type" {
  value = alicloud_cdn_domain.domain.cdn_type
}

output "source_type" {
  value = alicloud_cdn_domain.domain.source_type
}

output "sources" {
  value = alicloud_cdn_domain.domain.sources
}