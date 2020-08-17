module "asg" {
  source = "github.com/terraform-aws-modules/terraform-aws-autoscaling"

  name            = "dev-web"
  lc_name         = "dev-lc"
  image_id        = var.web_image_id
  instance_type   = var.web_instance_type
  security_groups = [module.security_group.this_security_group_id]
  load_balancers  = [module.elb.this_elb_id]

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name            = "dev-asg"
  vpc_zone_identifier = module.vpc.public_subnets
  health_check_type   = "EC2"
  min_size            = var.web_asg_min_size
  max_size            = var.web_asg_max_size
  desired_capacity    = var.web_asg_desired_capacity

  tags = [
    {
      key                 = "Terraform"
      value               = "True"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "Dev"
      propagate_at_launch = true
    },
  ]
}
