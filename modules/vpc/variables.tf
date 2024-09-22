variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidr_blocks" {
  type = map(string)
}

variable "private_subnet_cidr_blocks" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "resource_name_prefix" {
  type = string
}

