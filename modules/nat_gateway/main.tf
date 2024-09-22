resource "aws_eip" "natip" {
  domain = "vpc"

  tags = {
    Name = "${var.resource_name_prefix}NATIP"
  }
}

resource "aws_nat_gateway" "private" {
  allocation_id     = aws_eip.natip.id
  connectivity_type = "public"
  subnet_id         = var.public_subnet_id

  tags = {
    Name = "${var.resource_name_prefix}NATGateway"
  }
}

resource "aws_route_table" "private" {
  for_each = var.private_subnet_cidr_blocks

  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.private.id
  }

  tags = {
    Name = "${var.resource_name_prefix}PrivateRouteTable-${each.key}"
  }
}

resource "aws_route_table_association" "private" {
  for_each = var.private_subnet_cidr_blocks

  route_table_id = aws_route_table.private[each.key].id
  subnet_id      = var.private_subnet[each.key]
}

