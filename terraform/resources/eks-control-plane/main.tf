provider "aws" {
  aws_region = local.aws_region
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

terraform {
  backend "s3" {
    bucket = "001-audrey-master-bucket-source"
    # dynamodb_table = ""
    key    = "eks-control-plane/terraform.tfstate"
    region = "us-east-1"
  }
}

locals {
  aws_region              = "us-east-1"
  cluster_version         = "1.28"
  endpoint_private_access = false
  endpoint_public_access  = true

  tags = {
    "id"             = "001"
    "owner"          = "AudreyMelhy"
    "environment"    = "dev"
    "project"        = ""
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "eks-control-plane" {
  source                  = "../../modules/eks-control-plane"
  aws_region              = local.aws_region
  cluster_version         = local.cluster_version
  endpoint_private_access = local.endpoint_private_access
  endpoint_public_access  = local.endpoint_public_access
  tags                    = local.tags
}
