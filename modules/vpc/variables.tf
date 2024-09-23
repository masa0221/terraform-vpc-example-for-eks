variable "resource_name_prefix" {
  description = "A variable to specify the prefix for resource names"
  type        = string
}

variable "region" {
  description = "The AWS region where the resources will be created"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "A map of CIDR blocks for the public subnets"
  type        = map(string)
}

variable "private_subnet_cidr_blocks" {
  description = "A map of CIDR blocks for the private subnets"
  type        = map(string)
}

