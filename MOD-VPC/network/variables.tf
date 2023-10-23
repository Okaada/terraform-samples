variable "cidr_vpc" {
  description = "Cidr block to vpc"
  type        = string
}

variable "cidr_subnet" {
  description = "Cidr block to subnet"
  type        = string
}

variable "environment" {
  description = "Env where resource would be used"
}