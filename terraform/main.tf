provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "rds" {
  source = "./modules/rds"

  vpc_id                  = module.vpc.vpc_id
  private_subnets         = module.vpc.private_subnets
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  backup_retention_period = var.backup_retention_period
}

module "s3_backup" {
  source = "./modules/s3"

  bucket_name = var.s3_bucket_name
}

module "ecs" {
  source = "./modules/ecs"

  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  ecr_repository  = var.ecr_repository
  container_image = var.container_image
  db_endpoint     = module.rds.db_endpoint
  db_username     = var.db_username
  db_password     = var.db_password
}

module "route53" {
  source = "./modules/route53"

  domain_name = var.domain_name
  lb_dns_name = module.ecs.lb_dns_name
  lb_zone_id  = module.ecs.lb_zone_id
}