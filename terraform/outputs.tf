output "rds_endpoint" {
  description = "Endpoint do RDS PostgreSQL"
  value       = module.rds.db_endpoint
}

output "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  value       = module.ecs.ecs_cluster_name
}

output "route53_dns_name" {
  description = "Nome DNS do Route 53"
  value       = module.route53.dns_name
}

output "s3_backup_bucket_name" {
  description = "Nome do bucket S3 para backups"
  value       = module.s3_backup.bucket_name
}