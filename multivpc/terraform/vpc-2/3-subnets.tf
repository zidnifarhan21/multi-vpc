resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.central.id
  cidr_block        = var.subnet-private-cidr
  availability_zone = var.availability_zone

  tags = {
    "Name" = "$(var.vpc_name)-private-us-east-1a"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.central.id
  cidr_block              = var.subnet-public-cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    "Name" = "$(var.vpc_name)-public-us-east-1a"
  }
}
