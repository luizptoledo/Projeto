variable "domain_name" {
  description = "Nome do domínio para o Route 53"
  type        = string
}

variable "lb_dns_name" {
  description = "DNS do Load Balancer (ALB)"
  type        = string
}

variable "lb_zone_id" {
  description = "Zone ID do Load Balancer (ALB)"
  type        = string
}