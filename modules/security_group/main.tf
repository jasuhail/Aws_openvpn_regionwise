resource "aws_security_group" "sg_tf" {
  name        = var.tags["Name"]
  description = "Security group for OpenVPN server"
  vpc_id      = var.vpc_id

  tags = var.tags
}

# OpenVPN inbound rules
resource "aws_security_group_rule" "openvpn_in" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_tf.id
  description       = "OpenVPN incoming connections"
}

# SSH inbound rule (optional - for management)
resource "aws_security_group_rule" "ssh_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_tf.id
  description       = "SSH access for management"
}

# HTTPS inbound rule (for OpenVPN web UI)
resource "aws_security_group_rule" "https_in" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_tf.id
  description       = "HTTPS for OpenVPN web UI"
}

# HTTP inbound rule (for redirect to HTTPS)
resource "aws_security_group_rule" "http_in" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_tf.id
  description       = "HTTP redirect to HTTPS"
}

# Outbound rules - allow all outbound traffic
resource "aws_security_group_rule" "all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_tf.id
  description       = "Allow all outbound traffic"
}