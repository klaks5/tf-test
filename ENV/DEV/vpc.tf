module "vpc" {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc"

  name            = "dev-vpc"
  cidr            = var.vpc_cidr_block
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  tags = {
    Terraform   = "True"
    Environment = "Dev"
  }
}