variable "resource_name_prefix" {
  description = "A variable to specify the prefix for resource names"
  type        = string
}

variable "vpc_id" {
  description = "The variable to specify the ID of the VPC where the NAT gateway will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "The variable to specify the public subnet ID for the NAT gateway"
  type        = string
}

variable "private_subnet" {
  description = "A variable to map the private subnet IDs"
  type        = map(string)
}

variable "private_subnet_cidr_blocks" {
  description = "A variable to map the CIDR blocks of private subnets"
  type        = map(string)
}

