# Terraform TechTest

Terraform resources to create a load balanced web front end in AWS. NGINX AMI (Open Source Certified by Bitnami) from amazon marketplace is used as the web server. 

## Description

This module creates a ELB alongside a variety of related resources, including:

- A VPC & Security Group
- Public and Private subnets
- Public route tables
- An Internet Gateway
- Hosted Zone & ACM Certificate 
- Autoscaling group & Launch configuration

### Software Requirements

```bash
$ aws version = 1.16.190 
$ terraform version = v0.13.0
```

### Usage

To run, execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

### Outputs

| Name | Description |
|------|-------------|
| elb_dns_name | Domain name of the Load Balancer |