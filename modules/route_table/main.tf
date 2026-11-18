resource "aws_route_table" "rt_tf" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.create_default_route ? [1] : []

    content {
      cidr_block     = "0.0.0.0/0"
      gateway_id     = var.gateway_id
      nat_gateway_id = var.nat_gateway_id
    }
  }

  tags = var.tags
}

resource "aws_route_table_association" "rt_assoc" {
  for_each = toset(var.subnet_ids)

  subnet_id      = each.value
  route_table_id = aws_route_table.rt_tf.id
}