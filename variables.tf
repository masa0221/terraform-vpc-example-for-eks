variable "project_name" {
  type        = string
  description = "The value of project name. It is the prefix for the Name tag used in created resouces."

  default = "example-for-eks"
}

variable "region" {
  description = "The region for vpc."
  type        = string

  default = "ap-northeast-1"
}

variable "vpc_cidr_block" {
  description = "The cidr block for vpc."
  type        = string

  default = "172.20.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets."
  type        = map(string)

  default = {
    a : "172.20.0.0/19",
    c : "172.20.32.0/19",
    # d : "172.20.64.0/19",
  }
}

variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = map(string)

  default = {
    a : "172.20.96.0/19",
    c : "172.20.128.0/19",
    # d : "172.20.160.0/19",
  }
}

