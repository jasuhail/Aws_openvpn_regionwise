variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the route table"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the route table"
  type        = map(string)
  default     = {}
}

variable "create_default_route" {
  description = "Whether to create a default IPv4 route"
  type        = bool
  default     = false

  validation {
    condition = (
      !var.create_default_route ||
      var.gateway_id != null ||
      var.nat_gateway_id != null
    )

    error_message = "gateway_id or nat_gateway_id must be provided when create_default_route is true."
  }
}

variable "gateway_id" {
  description = "Internet Gateway ID for the default route"
  type        = string
  default     = null
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID for the default route"
  type        = string
  default     = null
}