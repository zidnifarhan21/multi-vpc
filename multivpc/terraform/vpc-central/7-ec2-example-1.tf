resource "aws_instance" "central-vyos" {
  ami           = "ami-03df3fd58950b6b49" # Replace with the desired VyOS AMI ID
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  # subnet_id     = "subnet-xxxxxxxx"   # Replace with your subnet ID
  key_name      = "devops" # Replace with your key pair name
  # associate_public_ip_address = true
  # vpc_security_group_ids      = [aws_security_group.scg-vyos.id]

  network_interface {
    network_interface_id = aws_network_interface.central-eni-public-vyos.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.central-eni-private-vyos.id
    device_index         = 1
  }
  
  tags = {
    Name = "Vyos Central"
  }

  # user_data = <<-EOF
  #   #!/bin/vbash

  #   configure
  #   set interfaces ethernet eth0 address 3.233.20.5/24
  #   set interfaces ethernet eth0 description "Public Interface"
  #   set interfaces ethernet eth1 address 192.168.1.1/24
  #   set interfaces ethernet eth1 description "VPN Interface"

  #   set security ike gateway 192.168.1.1
  #   set security ike encryption aes256-sha2
  #   set security ike dh-group group20
  #   set security ike mode main
  #   set security ipsec esp encryption aes256-sha2
  #   set security ipsec esp dh-group group20

  #   set security ipsec site-to-site "vpn"
  #   set security ipsec site-to-site "vpn" local-address 192.168.1.1
  #   set security ipsec site-to-site "vpn" remote-address 10.0.0.1
  #   set security ipsec site-to-site "vpn" ike-gateway 192.168.1.1
  #   set security ipsec site-to-site "vpn" ike-encryption aes256-sha2
  #   set security ipsec site-to-site "vpn" ike-dh-group group20
  #   set security ipsec site-to-site "vpn" esp-encryption aes256-sha2
  #   set security ipsec site-to-site "vpn" esp-dh-group group20
    
  #   set interfaces ethernet eth1 security ipsec site-to-site "vpn"

  #   commit
  #   save
  #   exit
  #   EOF
}

resource "aws_network_interface" "central-eni-private-vyos" {
  subnet_id   = aws_subnet.private-us-east-1a.id
  private_ips = ["10.0.0.5"]
  security_groups = [aws_security_group.scg-vyos.id]

  # attachment {
  #   instance     = aws_instance.central-vyos.id
  #   device_index = 2
  # }

  tags = {
    Name = "central-eni-private-vyos"
  }
}

resource "aws_network_interface" "central-eni-public-vyos" {
  subnet_id       = aws_subnet.public-us-east-1a.id
  private_ips     = ["10.0.1.5"]
  security_groups = [aws_security_group.scg-vyos.id]

  # attachment {
  #   instance     = aws_instance.central-vyos.id
  #   device_index = 1
  # }

  tags = {
    Name = "central-eni-public-vyos"
  }
}

resource "aws_eip" "one" {
  #domain                    = "vpc"
  network_interface         = aws_network_interface.central-eni-public-vyos.id
  associate_with_private_ip = "10.0.1.5"

  tags = {
    Name = "central-elastic-public-vyos"
  }
}