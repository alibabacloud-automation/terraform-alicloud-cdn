module "cdn" {
  source      = "../.."
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
  existing_domain_names = ["terraform001.test.com", "terraform002.test.com"]
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