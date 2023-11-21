variable "region" {
  description = "Region Name"
  type = string
  default = "us-east-1"
}

variable "availability_zone" {
    description = "AZ Name"
    type = string
    default = "us-east-1a"
}

variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "vpc-2"
}

variable "vpc-cidr" {
    description = "VPC CIDR"
    type = string
    default = "10.10.0.0/22"
}

variable "subnet-private-cidr" {
  description = "Private Subnet CIDR"
  type = string
  default = "10.10.1.0/24"
}

variable "subnet-public-cidr" {
  description = "Public Subnet CIDR"
  type = string
  default = "10.10.0.0/24"
}

variable "private-ip-vyos-publicsubnet" {
    description = "Private IP for Vyos ENI in Public Subnet"
    type = list(string)
    default = ["10.10.0.5"]
}

variable "private-ip-vyos-privatesubnet" {
    description = "Private IP for Vyos ENI in Private Subnet"
    type = list(string)
    default = ["10.10.1.5"]
}

variable "private-ip-linux-privatesubnet" {
    description = "Private IP for Linux ENI in Private Subnet"
    type = list(string)
    default = ["10.10.1.6"]
}



