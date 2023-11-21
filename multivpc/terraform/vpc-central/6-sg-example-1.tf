resource "aws_security_group" "scg-vyos" {
  name        = "scg-vyos"
  description = "Allow API Access"
  vpc_id      = aws_vpc.central.id
############# Inbound ################
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
############## Outbound ##############
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Vyos Security Group"
  }
}
