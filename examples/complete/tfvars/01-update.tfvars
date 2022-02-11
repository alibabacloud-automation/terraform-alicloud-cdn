# Cdn
sources = [
  {
    "content" : "test168.com",
    "type" : "domain",
    "port" : "443",
    "priority" : "30",
    "weight" : "20",
  }
]
tags = {
  Name = "updateCdn"
}

# Cdn_config
function_arg = [
  {
    "arg_name" : "ip_list",
    "arg_value" : "100.100.100.100"
  }
]