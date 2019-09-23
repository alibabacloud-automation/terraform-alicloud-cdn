variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "domain_name" {
  default = "jiaion.alicdn.com"
}

variable "type" {
  default = "web"
}

variable "origin_type" {
  default = "domain"
}

variable "origins" {
  type = list(string)

  default = [
    "jiaion.github.io",
  ]
}

