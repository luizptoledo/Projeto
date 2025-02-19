output "dns_name" {
  description = "Nome DNS do Route 53"
  value       = aws_route53_record.alias.name
}

output "zone_id" {
  description = "Zone ID da zona hospedada no Route 53"
  value       = aws_route53_zone.primary.zone_id
}