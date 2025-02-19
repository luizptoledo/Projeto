variable "vpc_cidr" {
  description = "CIDR block para a VPC"
  type        = string
}

variable "public_subnets" {
  description = "Lista de subnets públicas"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de subnets privadas"
  type        = list(string)
}