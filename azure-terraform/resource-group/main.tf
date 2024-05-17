#provider "azurerm" {
 # features {}
#}

resource "azurerm_resource_group" "example" {
  name     = "Audrey-rg2"
  location = var.location
  tags = var.tags
}

