terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-backend-rg"
    storage_account_name = "tfstate6bndan"
    container_name       = "tfstate-container6bndan"
    key                  = "rg-terraform.tfstate"
  }
}