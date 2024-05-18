#provider "azurerm" {
# features {}
#}

resource "azurerm_resource_group" "backend" {
  name     = "tfstate-backend-rg"
  location = var.location
  tags     = var.tags
}

