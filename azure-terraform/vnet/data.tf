# Data source to reference an existing resource group
data "azurerm_resource_group" "rg" {
  name = "tfstate-backend-rg"
}
