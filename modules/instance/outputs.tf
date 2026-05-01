output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.ec2_tf.id
}

output "public_ip" {
  description = "Public IP address"
  value       = aws_instance.ec2_tf.public_ip
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.ec2_tf.private_ip
}

output "eip_public_ip" {
  description = "Elastic IP address (if enabled)"
  value       = var.enable_eip ? aws_eip.eip_tf[0].public_ip : null
}

output "public_dns" {
  description = "Public DNS name"
  value       = aws_instance.ec2_tf.public_dns
}