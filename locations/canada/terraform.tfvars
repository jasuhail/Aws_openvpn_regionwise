# AWS Region
aws_region  = "ca-central-1"
environment = "canada"

# VPC
vpc_cidr = "10.0.0.0/16"
vpc_tags = {
  Name        = "OpenVPN-VPC-Canada"
  Environment = "canada"
  ManagedBy   = "Terraform"
}

# Public Subnets
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_tags = {
  Environment = "canada"
  Type        = "Public"
  ManagedBy   = "Terraform"
}

# Private Subnets
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
private_subnet_tags = {
  Environment = "canada"
  Type        = "Private"
  ManagedBy   = "Terraform"
}

# Availability Zones
availability_zones = ["ca-central-1a", "ca-central-1b"]

# Internet Gateway
igw_tags = {
  Name        = "OpenVPN-IGW-Canada"
  Environment = "canada"
  ManagedBy   = "Terraform"
}

# Route Tables
public_route_table_tags = {
  Name        = "OpenVPN-Public-RT-Canada"
  Environment = "canada"
  ManagedBy   = "Terraform"
}

private_route_table_tags = {
  Name        = "OpenVPN-Private-RT-Canada"
  Environment = "canada"
  ManagedBy   = "Terraform"
}

# Security Group
security_group_tags = {
  Name        = "OpenVPN-SG-Canada"
  Environment = "canada"
  ManagedBy   = "Terraform"
}

# EC2 Instance
openvpn_ami_id   = "ami-09ddce3f60d168bec" # Openvpn AM
instance_type    = "t3.small"
key_name         = "Ec2-Canada"
enable_eip       = true
root_volume_size = 8
root_volume_type = "gp3"
ec2_tags = {
  Name        = "OpenVPN-Canada"
  Environment = "canada"
  ManagedBy   = "Terraform"
  Service     = "OpenVPN"
}