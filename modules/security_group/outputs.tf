output "openvpn_sg_id" {
  value = aws_security_group.openvpn_sg.id  # Ensure this matches your security group resource name
}