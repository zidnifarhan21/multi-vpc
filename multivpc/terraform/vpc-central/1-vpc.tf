resource "aws_vpc" "central" {
  cidr_block = "10.0.0.0/22"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Central VPC"
  }
}
