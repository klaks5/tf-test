output "elb_dns_name" {
  description = "Domain name of the Load Balancer"
  value       = module.elb.this_elb_dns_name
}
