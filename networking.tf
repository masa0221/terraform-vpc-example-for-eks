resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name = "${local.resouce_name_prefix}VPC"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet_cidr_blocks

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = "${var.region}${each.key}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.resouce_name_prefix}PublicSubnet-${each.key}"
    # @see https://docs.aws.amazon.com/eks/latest/userguide/network-load-balancing.html
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet_cidr_blocks

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = "${var.region}${each.key}"
  map_public_ip_on_launch = false

  tags = {
    Name = "${local.resouce_name_prefix}PrivateSubnet-${each.key}"
    # @see https://docs.aws.amazon.com/eks/latest/userguide/network-load-balancing.html
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = {
    Name = "${local.resouce_name_prefix}PublicRouteTable"
  }
}

resource "aws_route_table_association" "public" {
  for_each = var.public_subnet_cidr_blocks

  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public[each.key].id
}

resource "aws_route_table" "private" {
  for_each = var.private_subnet_cidr_blocks

  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.private.id
  }

  tags = {
    Name = "${local.resouce_name_prefix}PrivateRouteTable-${each.key}"
  }
}

resource "aws_route_table_association" "private" {
  for_each = var.private_subnet_cidr_blocks

  route_table_id = aws_route_table.private[each.key].id
  subnet_id      = aws_subnet.private[each.key].id
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.resouce_name_prefix}InternetGateway"
  }
}

resource "aws_nat_gateway" "private" {
  allocation_id     = aws_eip.for_nat.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public[keys(var.private_subnet_cidr_blocks)[0]].id

  tags = {
    Name = "${local.resouce_name_prefix}NATGateway"
  }
}

resource "aws_eip" "for_nat" {
  domain = "vpc"

  tags = {
    Name = "${local.resouce_name_prefix}NATIP"
  }
}
