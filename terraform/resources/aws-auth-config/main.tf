provider "aws" {
  region = local.aws_region
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

locals {
  aws_region         = "us-east-1"
  control_plane_name = "001-audrey-cluster"
}

module "aws-auth-config" {
  source             = "../../modules/aws-auth-config"
  aws_region         = local.aws_region
  control_plane_name = local.control_plane_name
}
