resource "aws_instance" "openvpn" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  root_block_device {
    volume_size = 15
    volume_type = "gp2"
  }

  tags = {
    Name = "OpenVpn"
  }
}

resource "aws_eip_association" "openvpn_eip_assoc" {
  instance_id   = aws_instance.openvpn.id
  allocation_id  = var.eip_allocation_id
}