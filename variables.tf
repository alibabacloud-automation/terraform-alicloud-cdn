variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

#####################
# Cdn
#####################
variable "add_cdn_domain" {
  description = "Whether to add a Cdn domain. Default to true."
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "Name of a new cdn domain."
  type        = string
  default     = ""
}

variable "cdn_type" {
  description = "Cdn type of the cdn domain. Valid values are 'web', 'download', 'video'."
  type        = string
  default     = "web"
}

variable "sources" {
  description = "The source address list of the cdn domain. Each item can contains keys:'content'(The adress of source. Valid values can be ip or doaminName.),'type'(The type of the source. Valid values are 'ipaddr', 'domain' and 'oss'. Default to 'ipaddr'),'port'(The port of source. Valid values are '443' and '80'. Default value is '80'.),'priority'(Priority of the source. Valid values are '0' and '100'. Default value is '20'.),'weight'(Weight of the source. Valid values are from '0' to '100'. Default value is '10', but if type is 'ipaddr', the value can only be '10'.)."
  type        = list(map(string))
  default     = []
}

variable "scope" {
  description = "Scope of the cdn domain. Valid values are 'domestic', 'overseas', global'. Default value is 'domestic'. This parameter's setting is valid Only for the international users and domestic L3 and above users ."
  type        = string
  default     = "domestic"
}

variable "tags" {
  description = "A mapping of tags to assign to the cdn domain."
  type        = map(string)
  default     = {}
}

#####################
# Cdn_config
#####################
variable "existing_domain_names" {
  description = "List of added cdn domain names for batch configuration. If set, the 'set_config' should be true."
  type        = list(string)
  default     = []
}

variable "function_name" {
  description = "The name of the domain config."
  type        = string
  default     = ""
}

variable "function_arg" {
  description = "The args of the domain config."
  type = list(object({
    arg_name  = string
    arg_value = string
  }))
  default = []
}

variable "set_config" {
  description = "Whether to batch set config for new or existing domain names. Default to true."
  type        = bool
  default     = true
}
