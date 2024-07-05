# outputs.tf

output "alb_dns_name" {
  value       = aws_lb.app.dns_name
  description = "The DNS name of the load balancer"
}