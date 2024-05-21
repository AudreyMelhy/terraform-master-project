# Data source to reference an existing resource group
data "azurerm_resource_group" "rg" {
  name = "tfstate-backend-rg"
}

data "azurerm_virtual_network" "vnet" {
  name                = "vnet-htered89xe"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "subnet" {
  name                 = "subnet-htered89xe"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

