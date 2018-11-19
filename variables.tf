variable "domain_name" {
  default     = "jiaion.alicdn.com"
}

variable "type" {
  default     = "web"
}

variable "origin_type" {
  default     = "domain"
}

variable "origins" {
  type        = "list"

  default = [
    "jiaion.github.io",
  ]
}
