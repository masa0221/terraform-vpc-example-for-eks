variable "resource_name_prefix" {
  description = "A variable to specify the prefix for resource names"
  type        = string
}

variable "region" {
  description = "The AWS region where the resources will be created"
  type        = string
}

variable "cluster_identifier" {
  description = "A variable cluster identifier"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "The variable to specify the ID of the VPC where the RDS Cluster will be created"
  type        = string
}


variable "private_subnet_ids" {
  description = "A list of private subnet IDs used for the network configuration."
  type        = list(string)
}

variable "inbound_security_group_ids" {
  description = "A list of security group IDs that allow inbound access to the RDS instance."
  type        = list(string)
}

