output "openvpn_instance_id" {
  value = module.instance.openvpn
}

output "eip" {
  value = aws_eip.openvpn_eip.public_ip  # Output the public IP of the EIP
}