output "openvpn_instance_id" {
  value = aws_instance.openvpn_instance.id
}

output "eip" {
  value = aws_eip.openvpn_eip.public_ip  # Output the public IP of the EIP
}