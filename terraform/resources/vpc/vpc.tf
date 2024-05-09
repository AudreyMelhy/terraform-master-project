terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = local.region
}

terraform {
  backend "s3" {
    bucket = "terraform-project-main"
    # dynamodb_table = "AudreyM-tfstate-locking"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}


locals {
  region             = "us-east-1"
  name               = "001-AudreyMelhy-vpc"
  cidr_block         = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  environment        = "dev"

  tags = {
    "id"          = "001"
    "owner"       = "AudreyMelhy"
    "environment" = "dev"
    "phase"       = "vpc_module"
  }
}

module "vpc" {
  source             = "../../modules/vpc"
  aws_region         = local.region
  vpc_name           = local.name
  vpc_cidr_block     = local.cidr_block
  availability_zones = local.availability_zones
  nat_gateway_count  = 0
  eip_count          = 0
  tags               = local.tags
}



