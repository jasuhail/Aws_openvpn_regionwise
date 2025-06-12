provider "aws" {
  region = var.AWS_REGION
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  availability_zone_1 = "eu-west-1a"
  availability_zone_2 = "eu-west-1b"
  availability_zone_3 = "eu-west-1c"
  subnet_cidrs = var.subnet_cidrs
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
  subnet_id = module.vpc.openvpn_public_subnet_1_id  # Ensure this matches the output name
  vpc_security_group_ids = [module.security_group.openvpn_sg_id]
}