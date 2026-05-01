# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

# Environment
variable "environment" {
  description = "Environment name (canada/ireland)"
  type        = string
}

# VPC
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type        = map(string)
  default     = {}
}

# Public Subnets
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "public_subnet_tags" {
  description = "Tags for public subnets"
  type        = map(string)
  default     = {}
}

# Private Subnets
variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "private_subnet_tags" {
  description = "Tags for private subnets"
  type        = map(string)
  default     = {}
}

# Availability Zones
variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

# Internet Gateway
variable "igw_tags" {
  description = "Tags for Internet Gateway"
  type        = map(string)
  default     = {}
}

# Public Route Table
variable "public_route_table_tags" {
  description = "Tags for public route table"
  type        = map(string)
  default     = {}
}

# Private Route Table
variable "private_route_table_tags" {
  description = "Tags for private route table"
  type        = map(string)
  default     = {}
}

# Security Group
variable "security_group_tags" {
  description = "Tags for Security Group"
  type        = map(string)
  default     = {}
}

# EC2 Instance
variable "openvpn_ami_id" {
  description = "OpenVPN AMI ID for the region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "enable_eip" {
  description = "Create and associate Elastic IP"
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
}

variable "ec2_tags" {
  description = "Tags for EC2 instance"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "User data script"
  type        = string
  default     = null
}