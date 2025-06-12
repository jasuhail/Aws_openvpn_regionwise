variable "cidr_block" {
  type = string
}

variable "availability_zone_1" {
  type = string
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}