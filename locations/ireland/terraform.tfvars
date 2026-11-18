# AWS Region
aws_region   = "eu-west-1"
environment  = "ireland"

# VPC
vpc_cidr = "10.1.0.0/16"
vpc_tags = {
  Name        = "OpenVPN-VPC-Ireland"
  Environment = "ireland"
  ManagedBy   = "Terraform"
}

# Public Subnets
public_subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]
public_subnet_tags = {
  Environment = "ireland"
  Type        = "Public"
  ManagedBy   = "Terraform"
}

# Private Subnets
private_subnet_cidrs = ["10.1.10.0/24", "10.1.11.0/24"]
private_subnet_tags = {
  Environment = "ireland"
  Type        = "Private"
  ManagedBy   = "Terraform"
}

# Availability Zones
availability_zones = ["eu-west-1a", "eu-west-1b"]

# Internet Gateway
igw_tags = {
  Name        = "OpenVPN-IGW-Ireland"
  Environment = "ireland"
  ManagedBy   = "Terraform"
}

# Route Tables
public_route_table_tags = {
  Name        = "OpenVPN-Public-RT-Ireland"
  Environment = "ireland"
  ManagedBy   = "Terraform"
}

private_route_table_tags = {
  Name        = "OpenVPN-Private-RT-Ireland"
  Environment = "ireland"
  ManagedBy   = "Terraform"
}

# Security Group
security_group_tags = {
  Name        = "OpenVPN-SG-Ireland"
  Environment = "ireland"
  ManagedBy   = "Terraform"
}

# EC2 Instance
openvpn_ami_id   = "ami-05732c1f3b282f204"  # Openvpn AMI
instance_type    = "t3.small"
key_name         = "Ec2"
enable_eip       = true
root_volume_size = 8
root_volume_type = "gp3"
ec2_tags = {
  Name        = "OpenVPN-Ireland"
  Environment = "ireland"
  ManagedBy   = "Terraform"
  Service     = "OpenVPN"
}