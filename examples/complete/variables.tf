#####################
# Cdn
#####################
variable "sources" {
  description = "The source address list of the cdn domain. Each item can contains keys:'content'(The adress of source. Valid values can be ip or doaminName.),'type'(The type of the source. Valid values are 'ipaddr', 'domain' and 'oss'. Default to 'ipaddr'),'port'(The port of source. Valid values are '443' and '80'. Default value is '80'.),'priority'(Priority of the source. Valid values are '0' and '100'. Default value is '20'.),'weight'(Weight of the source. Valid values are from '0' to '100'. Default value is '10', but if type is 'ipaddr', the value can only be '10'.)."
  type        = list(map(string))
  default = [
    {
      content  = "1.1.1.1"
      type     = "ipaddr"
      port     = 80
      priority = 20
      weight   = 10
    }
  ]
}

variable "tags" {
  description = "A mapping of tags to assign to the cdn domain."
  type        = map(string)
  default = {
    Name = "Cdn"
  }
}

#####################
# Cdn_config
#####################
variable "function_arg" {
  description = "The args of the domain config."
  type = list(object({
    arg_name  = string
    arg_value = string
  }))
  default = [{
    "arg_name" : "ip_list",
    "arg_value" : "110.110.110.110"
  }]
}