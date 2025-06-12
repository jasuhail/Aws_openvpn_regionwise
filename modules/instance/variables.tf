variable "AMIS" {
  type = map(string)
}

variable "AWS_REGION" {
  type = string
}

variable "INSTANCE_TYPE" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "eip_allocation_id" {
  type = string
}