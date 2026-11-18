# VPC Module
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  tags     = var.vpc_tags
}

# Public Subnets
module "public_subnet" {
  source = "./modules/subnet"

  vpc_id                  = module.vpc.vpc_id
  subnet_cidrs            = var.public_subnet_cidrs
  availability_zones      = var.availability_zones
  map_public_ip_on_launch = true
  tags                    = var.public_subnet_tags
}

# Private Subnets
module "private_subnet" {
  source = "./modules/subnet"

  vpc_id                  = module.vpc.vpc_id
  subnet_cidrs            = var.private_subnet_cidrs
  availability_zones      = var.availability_zones
  map_public_ip_on_launch = false
  tags                    = var.private_subnet_tags
}

# Internet Gateway
module "igw" {
  source = "./modules/internet_gateway"

  vpc_id = module.vpc.vpc_id
  tags   = var.igw_tags
}

# Public Route Table
module "public_route_table" {
  source = "./modules/route_table"

  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.public_subnet.subnet_ids
  create_default_route = true
  gateway_id           = module.igw.igw_id
  tags                 = var.public_route_table_tags
}

# Private Route Table
module "private_route_table" {
  source = "./modules/route_table"

  vpc_id               = module.vpc.vpc_id
  subnet_ids           = module.private_subnet.subnet_ids
  create_default_route = false
  tags                 = var.private_route_table_tags
}
# Security Group
module "security_group" {
  source = "./modules/security_group"

  vpc_id = module.vpc.vpc_id
  tags   = var.security_group_tags
}

# EC2 Instance
module "ec2" {
  source = "./modules/instance"

  openvpn_ami_id         = var.openvpn_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = module.public_subnet.subnet_ids[0]
  vpc_security_group_ids = [module.security_group.security_group_id]
  enable_eip             = var.enable_eip
  root_volume_size       = var.root_volume_size
  root_volume_type       = var.root_volume_type
  tags                   = var.ec2_tags
  user_data              = var.user_data
}