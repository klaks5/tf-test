variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "The CIDR block for the destination route"
  default     = []
}

variable "private_subnets" {
  description = "The CIDR block for the destination route"
  default     = []
}

variable "public_subnets" {
  description = "The CIDR block for the destination route"
  default     = []
}

variable "destination_cidr_block" {
  description = "The CIDR block for the destination route"
  default     = "0.0.0.0/0"
}

variable "sg_cidr_block" {
  description = "The CIDR block for the security group"
  default     = ["0.0.0.0/0"]
}

variable web_image_id {
  description = "AMI of the instance image"
  type        = string
}

variable web_instance_type {
  description = "Type of the instance"
  type        = string
}

variable web_asg_desired_capacity {
  description = "Desired capacity for the auto scaling group instances"
  type        = number
}

variable web_asg_max_size {
  description = "Maximum capacity for the auto scaling group instances"
  type        = number
}

variable web_asg_min_size {
  description = "Minumum capacity for the auto scaling group instances"
  type        = number
}
