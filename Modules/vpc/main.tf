resource "aws_vpc" "openvpn_vpc" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "OpenVpn Terraform"
  }
}

resource "aws_subnet" "openvpn-public-1" {
  vpc_id                  = aws_vpc.openvpn_vpc.id
  cidr_block              = var.subnet_cidrs[0]  # First subnet CIDR
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "OpenVpn Public 1"
  }
}

resource "aws_subnet" "openvpn-public-2" {
  vpc_id                  = aws_vpc.openvpn_vpc.id
  cidr_block              = var.subnet_cidrs[1]  # Second subnet CIDR
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_2

  tags = {
    Name = "OpenVpn Public 2"
  }
}

resource "aws_subnet" "openvpn-public-3" {
  vpc_id                  = aws_vpc.openvpn_vpc.id
  cidr_block              = var.subnet_cidrs[2]  # Third subnet CIDR
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_3

  tags = {
    Name = "OpenVpn Public 3"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.openvpn_vpc.id
  cidr_block              = var.subnet_cidrs[3]  # Private subnet CIDR
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zone_1

  tags = {
    Name = "OpenVpn Private 1"
  }
}