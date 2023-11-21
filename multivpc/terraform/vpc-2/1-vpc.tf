resource "aws_vpc" "central" {
  cidr_block = var.vpc-cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "$(var.vpc_name) VPC"
  }
}
