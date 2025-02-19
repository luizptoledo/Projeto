variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block para a VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Lista de subnets públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Lista de subnets privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_name" {
  description = "Nome do banco de dados PostgreSQL"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "Usuário do banco de dados"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  sensitive   = true
}

variable "backup_retention_period" {
  description = "Período de retenção de backups do RDS (em dias)"
  type        = number
  default     = 7
}

variable "s3_bucket_name" {
  description = "Nome do bucket S3 para backups"
  type        = string
  default     = "my-backup-bucket"
}

variable "ecr_repository" {
  description = "Nome do repositório ECR para as imagens Docker"
  type        = string
  default     = "my-ecr-repo"
}

variable "container_image" {
  description = "Imagem Docker para deploy no ECS"
  type        = string
  default     = "my-container-image:latest"
}

variable "domain_name" {
  description = "Nome do domínio para o Route 53"
  type        = string
  default     = "example.com"
}