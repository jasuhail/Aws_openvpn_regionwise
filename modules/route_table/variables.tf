variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "internet_gateway_id" {
  description = "ID of the Internet Gateway (null for private route table)"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the Route Table"
  type        = map(string)
  default     = {}
}