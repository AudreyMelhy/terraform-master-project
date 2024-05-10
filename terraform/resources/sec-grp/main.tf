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
    bucket = "001-audrey-master-bucket-source"
    # dynamodb_table = "AudreyM-tfstate-locking"
    key    = "sg/terraform.tfstate"
    region = "us-east-1"
  }
}

locals {
  region = "us-east-1"
  name   = "001-AudreyMelhy-vpc"
  ports  = [22, 80, 8080, 443]


  tags = {
    "id"          = "001"
    "owner"       = "AudreyMelhy"
    "environment" = "dev"
    "resource"    = "sec_groups"
  }
}

module "sec-grp" {
  source = "../../modules/sec-grp"
  region = local.region
  tags   = local.tags
}
