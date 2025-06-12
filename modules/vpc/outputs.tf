output "openvpn_vpc_id" {
  value = aws_vpc.openvpn_vpc.id  # Ensure this matches your VPC resource name
}

output "openvpn_public_subnet_1_id" {
  value = aws_subnet.openvpn-public-1.id  # Ensure this matches your subnet resource name
}

output "openvpn_public_subnet_2_id" {
  value = aws_subnet.openvpn-public-2.id  # Add this if you have a second public subnet
}

output "openvpn_public_subnet_3_id" {
  value = aws_subnet.openvpn-public-3.id  # Add this if you have a third public subnet
}