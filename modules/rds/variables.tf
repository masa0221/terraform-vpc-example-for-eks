variable "resource_name_prefix" {
  description = "A variable to specify the prefix for resource names"
  type        = string
}

variable "cluster_identifier" {
  description = "A variable cluster identifier"
  type        = string
  default     = ""
}

variable "region" {
  description = "The AWS region where the resources will be created"
  type        = string
}

variable "private_subnet_ids" {
  description = "A list of private subnet IDs used for the network configuration."
  type        = list(string)
}

variable "security_group_ids" {
  description = "A list of security group IDs that control access to resources."
  type        = list(string)
}

