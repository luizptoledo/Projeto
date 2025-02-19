variable "vpc_id" {
  description = "ID da VPC"
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

variable "ecr_repository" {
  description = "Nome do repositório ECR"
  type        = string
}

variable "container_image" {
  description = "Imagem Docker para deploy"
  type        = string
}

variable "db_endpoint" {
  description = "Endpoint do banco de dados"
  type        = string
}

variable "db_username" {
  description = "Usuário do banco de dados"
  type        = string
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  sensitive   = true
}