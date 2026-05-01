variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Whether to assign public IP on launch"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for subnets"
  type        = map(string)
  default     = {}
}