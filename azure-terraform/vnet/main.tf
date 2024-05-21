resource "random_string" "rs" {
  length  = 10
  special = false
  upper   = false
  numeric = true
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${random_string.rs.result}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = var.tags
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-${random_string.rs.result}"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

}