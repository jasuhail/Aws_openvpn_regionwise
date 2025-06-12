output "openvpn_instance_id" {
  description = "The ID of the OpenVPN instance"
  value       = module.instance.openvpn_instance_id
}

output "openvpn_eip" {
  description = "The Elastic IP address of the OpenVPN instance"
  value       = module.instance.eip
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.openvpn_vpc_id
}

output "security_group_id" {
  description = "The ID of the OpenVPN security group"
  value       = module.security_group.openvpn_sg.id
}