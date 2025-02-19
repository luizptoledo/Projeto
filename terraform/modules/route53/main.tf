# Cria uma zona hospedada no Route 53 para o domínio
resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

# Cria um registro ALIAS que aponta para o Load Balancer (ALB)
resource "aws_route53_record" "alias" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.lb_dns_name
    zone_id                = var.lb_zone_id
    evaluate_target_health = true
  }
}

# Cria um registro CNAME para o subdomínio "www" que aponta para o Load Balancer (ALB)
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [var.lb_dns_name]
}
