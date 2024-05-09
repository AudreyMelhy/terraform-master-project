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
    bucket = "001-s5audrey-bucket-source"
    # dynamodb_table = "AudreyM-tfstate-locking"
    key    = "bastion/terraform.tfstate"
    region = "us-east-1"
  }
}

locals {
  region                        = "us-east-1"
  ec2_ami                       = ""
  ec2_instance_name             = "bastion-001-audrey"
  ec2_instance_type             = "t2.medium"
  ec2_key_name                  = "terraform-aws"
  pub_ip                        = true
  tenancy                       = "default"
  enable_termination_protection = false
  root_volume_size              = 30
  sec_grp                       = "bastion-001-dev-sg"
  allowed_ports = [
    22
  ]

  tags = {
    "id"          = "001"
    "owner"       = "AudreyMelhy"
    "environment" = "dev"
    "resource"    = "bastion_module"
  }
}

module "bastion_host" {
  source     = "../../modules/bastion"
  aws_region = local.region
  # ami = local.ec2_ami
  # instance_name = local.ec2_instance_name
  instance_type = local.ec2_instance_type
  key           = local.ec2_key_name
  tenancy       = local.tenancy
  # sec_grp = local.sec_grp
  volume_size     = local.root_volume_size
  api_termination = local.enable_termination_protection
  # allowed_ports = local.allowed_ports
  pub_ip = local.pub_ip
  tags   = local.tags
}