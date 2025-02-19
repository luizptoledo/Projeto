output "ecs_cluster_name" {
  description = "Nome do cluster ECS"
  value       = aws_ecs_cluster.cluster.name
}

output "lb_dns_name" {
  description = "DNS do Load Balancer"
  value       = aws_lb.lb.dns_name
}

output "lb_zone_id" {
  description = "Zone ID do Load Balancer"
  value       = aws_lb.lb.zone_id
}