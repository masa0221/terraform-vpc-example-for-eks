resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name = "${var.resource_name_prefix}VPC"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet_cidr_blocks

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = "${var.region}${each.key}"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "${var.resource_name_prefix}PublicSubnet-${each.key}"
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
    Name                              = "${var.resource_name_prefix}PrivateSubnet-${each.key}"
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
    Name = "${var.resource_name_prefix}PublicRouteTable"
  }
}

resource "aws_route_table_association" "public" {
  for_each = var.public_subnet_cidr_blocks

  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public[each.key].id
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.resource_name_prefix}InternetGateway"
  }
}
