resource "aws_internet_gateway" "central-igw" {
  vpc_id = aws_vpc.central.id

  tags = {
    Name = "igw"
  }
}
