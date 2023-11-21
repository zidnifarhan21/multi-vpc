resource "aws_route_table" "central-private" {
  vpc_id = aws_vpc.central.id

  route {
    cidr_block     = "0.0.0.0/0"
    network_interface_id = aws_network_interface.central-eni-private-vyos.id # ENI nya vyos di private subnet
  }

  tags = {
    Name = "central-private"
  }
}

resource "aws_route_table" "central-public" {
  vpc_id = aws_vpc.central.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.central-igw.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table_association" "private-us-east-1a" {
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.central-private.id
}

resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.central-public.id
}

