terraform {
  required_version = ">= 1.0.0"
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
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}


locals {
  region                  = "us-east-1"
  image_id                = "ami-080e1f13689e07408"
  AZs                     = ["subnet-0dafda3a023daf0f0", "subnet-0f03c20123d5947c3", "subnet-0a1a9c9bbf4e8a07b", "subnet-0ec7d577a39c416fa", "subnet-075b4dcfc5fcc7c1c"]
  public_subnets          = ["subnet-0dafda3a023daf0f0", "subnet-0f03c20123d5947c3", "subnet-0a1a9c9bbf4e8a07b", "subnet-0ec7d577a39c416fa", "subnet-075b4dcfc5fcc7c1c"]
  environment             = "dev"
  type                    = t2.micro
  eks_version             = 1.29
  endpoint_private_access = false
  endpoint_public_access  = true

  tags = {
    "id"      = "001"
    "owner"   = "s5audrey"
    "project" = "a1_s5"
    "phase"   = "eks_module"
  }


}

module "eks" {
  source                  = "../../modules/eks"
  aws_region              = local.region
  image_id                = local.image_id
  AZs                     = local.AZs
  public_subnets          = local.public_subnets
  environment             = local.environment
  instance_type           = local.type
  eks_version             = local.eks_version
  endpoint_private_access = local.endpoint_private_access
  endpoint_public_access  = local.endpoint_public_access
  tags                    = local.tags
}
