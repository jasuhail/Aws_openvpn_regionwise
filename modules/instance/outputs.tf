output "openvpn" {
  value = aws_instance.openvpn.id
}

output "eip" {
  value = aws_eip.openvpn_eip.public_ip  # Output the public IP of the EIP
}