resource "aws_instance" "linux" {
  ami           = "ami-0261755bbcb8c4a84"
  instance_type = "t3.micro"
  key_name      = "devops"
  #subnet_id     = aws_subnet.private-us-east-1a.id                # Conflict dengan network_interface
  #vpc_security_group_ids = [aws_security_group.scg-instances.id]  #

  network_interface {
    network_interface_id = aws_network_interface.central-eni-private-instances.id
    device_index         = 0
  }

  tags = {
    Name = "Linux Instances"
  }
}



resource "aws_network_interface" "central-eni-private-instances" {
  subnet_id   = aws_subnet.private-us-east-1a.id
  private_ips = ["10.0.0.4"]
  security_groups = [aws_security_group.scg-instances.id]

  tags = {
    Name = "central-eni-private-instances"
  }
}