# VSwitch variables
variable "domain_name" {
}

variable "type" {
  default     = "web"
}

variable "origin_type" {
  default     = "domain"
}

variable "origin_port" {
  default     = "80"
}

variable "origins" {
  type        = "list"
}
