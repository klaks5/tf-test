resource "aws_route53_zone" "dev-web" {
  name          = "tf-techtest.co.uk"
  force_destroy = true
}

module "acm" {
  source = "github.com/terraform-aws-modules/terraform-aws-acm"

  zone_id                   = aws_route53_zone.dev-web.zone_id
  domain_name               = "tf-techtest.co.uk"
  wait_for_validation       = false   // Setting validation to false as it takes several hours for ACM to validate the domain name and issue the certificate
  validation_method         = "DNS"
}
