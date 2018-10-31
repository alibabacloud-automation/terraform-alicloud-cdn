# VSwitch variables
variable "domain_name" {
  description = "The name of a new cdn domain."
}

variable "type" {
  description = "The is cdn business type."
  default     = "web"
}

variable "origin_type" {
  description = "The type origin type"
  default     = "domain"
}

variable "origin_port" {
  description = "The type origin port"
  default     = "80"
}

variable "origins" {
  description = "The origin instanes."
  type = "list"
}
