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
    key    = "eks-node-group/terraform.tfstate"
    region = "us-east-1"
  }
}

locals {
  aws_region         = "us-east-1"
  control_plane_name = "audrey-control-plane"


  cluster_version = "1.28"
  node_min        = "1"
  desired_node    = "1"
  node_max        = "1"

  blue_node_color  = "blue"
  green_node_color = "green"

  blue  = false
  green = true

  ec2_ssh_key               = "terraform-aws"
  deployment_nodegroup      = "blue_green"
  capacity_type             = "ON_DEMAND"
  ami_type                  = "AL2_x86_64"
  instance_types            = "t2.medium"
  disk_size                 = "10"
  shared_owned              = "shared"
  enable_cluster_autoscaler = "true"



  tags = {
    "id"             = "001"
    "owner"          = "AudreyMelhy"
    "environment"    = "dev"
    "project"        = ""
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "eks-node-group" {
  source                    = "../../modules/eks-node-group"
  aws_region                = local.aws_region
  control_plane_name        = local.control_plane_name
  cluster_version           = local.cluster_version
  node_min                  = local.node_min
  desired_node              = local.desired_node
  node_max                  = local.node_max
  blue_node_color           = local.blue_node_color
  green_node_color          = local.green_node_color
  blue                      = local.blue
  green                     = local.green
  ec2_ssh_key               = local.ec2_ssh_key
  deployment_nodegroup      = local.deployment_nodegroup
  capacity_type             = local.capacity_type
  ami_type                  = local.ami_type
  instance_types            = local.instance_types
  disk_size                 = local.disk_size
  shared_owned              = local.shared_owned
  enable_cluster_autoscaler = local.enable_cluster_autoscaler
  tags                      = local.tags
}
