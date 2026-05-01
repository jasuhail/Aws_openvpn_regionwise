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

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
  default     = null
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

variable "tags" {
  description = "Tags for the instance"
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "User data script"
  type        = string
  default     = null
}