terraform {
  backend "s3" {
    bucket = "001-audrey-master-bucket-source"
    key    = "azure-terraform/backend-rg/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = ""
  }
}
