output "eip" {
  value = aws_eip.openvpn_eip.public_ip 
}