output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc_tf.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.vpc_tf.cidr_block
}