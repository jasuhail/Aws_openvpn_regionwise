variable "cidr_block" {
  type = string
}

variable "availability_zone_1" {
  type = string
}

variable "availability_zone_2" {
  description = "The second availability zone for the VPC"
  type        = string
}

variable "availability_zone_3" {
  description = "The third availability zone for the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}