provider "aws" {
  region = var.AWS_REGION
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  availability_zone_1 = "eu-west-1a"
  subnet_cidrs = [
    "10.0.1.0/24",  # Public subnet 1
    "10.0.2.0/24",  # Public subnet 2
    "10.0.3.0/24",  # Public subnet 3
    "10.0.4.0/24"   # Private subnet
  ]
}
module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.openvpn_vpc_id
}

module "instance" {
  source = "./modules/instance"
  AMIS = var.AMIS
  AWS_REGION = var.AWS_REGION
  INSTANCE_TYPE = var.INSTANCE_TYPE
  key_name = "EC2Acces"
  subnet_id = module.vpc.openvpn-public-1.id
  vpc_security_group_ids = [module.security_group.openvpn_sg.id]
  eip_allocation_id = aws_eip.openvpn_eip.id
}

resource "aws_eip" "openvpn_eip" {
  vpc = true
  tags = {
    Name = "OpenVpn Elastic IP"
  }
}