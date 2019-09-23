######
# CDN Instance
######
provider "alicloud" {
  version              = ">=1.56.0"
  region               = var.region != "" ? var.region : null
  configuration_source = "terraform-alicloud-modules/cdn-domain"
}

module "cdn" {
  source = "./modules/cdn"

  domain_name = var.domain_name
  type        = var.type

  origin_type = var.origin_type
  origins     = var.origins
}

