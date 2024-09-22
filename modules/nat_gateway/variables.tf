variable "vpc_id" {
  description = "The ID of the VPC where the NAT gateway will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "public subnet id for nat gateway"
  type        = string
}

variable "resource_name_prefix" {
  type = string
}

variable "private_subnet_cidr_blocks" {
  type = map(string)
}

variable "private_subnet" {
  type = map(string)
}

