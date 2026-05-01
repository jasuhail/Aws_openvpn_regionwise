resource "aws_instance" "ec2_tf" {
  ami                    = var.openvpn_ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data              = var.user_data

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = true
  }

  tags = var.tags
}

resource "aws_eip" "eip_tf" {
  count  = var.enable_eip ? 1 : 0
  domain = "vpc"

  tags = var.tags
}

resource "aws_eip_association" "eip_assoc" {
  count         = var.enable_eip ? 1 : 0
  instance_id   = aws_instance.ec2_tf.id
  allocation_id = aws_eip.eip_tf[0].id
}