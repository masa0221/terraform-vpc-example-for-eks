terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.63"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "dev"
    }
  }
}

locals {
  resouce_name_prefix = "${var.project_name}/"
}

module "vpc" {
  source = "./modules/vpc"

  resource_name_prefix = local.resouce_name_prefix

  region                     = var.region
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}

module "nat_gateway" {
  source = "./modules/nat_gateway"

  resource_name_prefix = local.resouce_name_prefix

  vpc_id                     = module.vpc.vpc_id
  public_subnet_id           = element(values(module.vpc.subnet.public), 0)
  private_subnet             = module.vpc.subnet.private
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}

