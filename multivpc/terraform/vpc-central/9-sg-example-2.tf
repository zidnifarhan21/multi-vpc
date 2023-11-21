resource "aws_security_group" "scg-instances" {
  name        = "scg-instances"
  description = "Allow API Access"
  vpc_id      = aws_vpc.central.id
############### Inbound ###################
  ingress {
    description = "Allow Health Checks"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
############### Outbound ##################
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
