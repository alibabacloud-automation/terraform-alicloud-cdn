resource "alicloud_cdn_domain" "domain" {
  domain_name = var.domain_name
  cdn_type    = var.type

  source_type = var.origin_type
  source_port = var.origin_port
  sources     = var.origins
}

