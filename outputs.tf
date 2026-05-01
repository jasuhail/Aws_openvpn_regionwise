# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr
}

# Public Subnet Outputs
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.public_subnet.subnet_ids
}

output "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  value       = module.public_subnet.subnet_cidrs
}

# Private Subnet Outputs
output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.private_subnet.subnet_ids
}

output "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  value       = module.private_subnet.subnet_cidrs
}

# Internet Gateway Output
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.igw.internet_gateway_id
}

# Route Table Outputs
output "public_route_table_id" {
  description = "ID of the public route table"
  value       = module.public_route_table.route_table_id
}

output "private_route_table_id" {
  description = "ID of the private route table"
  value       = module.private_route_table.route_table_id
}

# Security Group Outputs
output "security_group_id" {
  description = "ID of the Security Group"
  value       = module.security_group.security_group_id
}

output "security_group_name" {
  description = "Name of the Security Group"
  value       = module.security_group.security_group_name
}

# EC2 Instance Outputs
output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "public_ip" {
  description = "Public IP address"
  value       = module.ec2.public_ip
}

output "private_ip" {
  description = "Private IP address"
  value       = module.ec2.private_ip
}

output "eip_public_ip" {
  description = "Elastic IP address (if enabled)"
  value       = module.ec2.eip_public_ip
}

output "public_dns" {
  description = "Public DNS name"
  value       = module.ec2.public_dns
}