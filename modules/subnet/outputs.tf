output "subnet_ids" {
  description = "List of subnet IDs"
  value       = aws_subnet.subnet_tf[*].id
}

output "subnet_cidrs" {
  description = "List of subnet CIDRs"
  value       = aws_subnet.subnet_tf[*].cidr_block
}