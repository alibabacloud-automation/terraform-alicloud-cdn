######
# CDN Instance
######
module "cdn" {
  source = "./modules/cdn"

  domain_name = "${var.domain_name}"
  type    = "${var.type}"

  origin_type = "${var.origin_type}"
  origins     = "${var.origins}"
}
