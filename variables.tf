variable "domain_name" {
  description = "The name of a new cdn domain."
  default     = "jiaion.alicdn.com"
}

variable "type" {
  description = "The is cdn business type."
  default     = "web"
}

variable "origin_type" {
  description = "The type origin type"
  default     = "domain"
}

variable "origins" {
  description = "The origin instanes."
  type = "list"
  default     = [
    "jiaion.github.io",
    "jiaion.github.com",
  ]

}
