variable "AWS_REGION" {
  description = "The AWS region to deploy resources"
  default     = "eu-west-1"
}

variable "INSTANCE_TYPE" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "AMIS" {
  description = "Map of AMIs for different regions"
  type        = map(string)
  default = {
    ap-south-1     = "ami-01614d815cf856337"
    ap-south-2     = "ami-030c4c3f488a30239"
    eu-west-1      = "ami-0f6f5a74e666160bb"
    eu-central-1   = "ami-039470c0765f439c4"
    eu-central-2   = "ami-0e5a8559984e19563"
    us-west-2      = "ami-08e3ff0dfac458a93"
    ap-southeast-1 = "ami-0c2639422d6fc7d69"
    ap-southeast-2 = "ami-056303ef214800fec"
  }
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
  default     = "EC2Acces"
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}