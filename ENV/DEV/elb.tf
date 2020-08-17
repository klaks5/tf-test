module "elb" {
  source = "github.com/terraform-aws-modules/terraform-aws-elb"

  name            = "dev-web"
  subnets         = module.vpc.public_subnets
  security_groups = [module.security_group.this_security_group_id]
  internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "http"
      lb_port           = "80"
      lb_protocol       = "http"
    },

    // Commenting out https listener for this test as acm certification validation takes time to validate the cert
//    {
//      instance_port      = "80"
//      instance_protocol  = "http"
//      lb_port            = "443"
//      lb_protocol        = "https"
//      ssl_certificate_id = module.acm.this_acm_certificate_arn
//    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  tags = {
    Terraform   = "True"
    Environment = "Dev"
  }
}