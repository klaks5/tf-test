module "security_group" {
  source = "github.com/terraform-aws-modules/terraform-aws-security-group"

  name        = "dev_security_group"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.sg_cidr_block
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  egress_cidr_blocks  = var.sg_cidr_block
  egress_rules        = ["all-all"]

  tags = {
    Terraform   = "True"
    Environment = "Dev"
  }
}