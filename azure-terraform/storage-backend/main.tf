resource "random_string" "rs" {
  length  = 10
  special = false
  upper   = false
  numeric = true
}

resource "azurerm_resource_group" "rg3" {
  name     = "storage-backend-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "sa2" {
  name                     = "tfstate${random_string.rs.result}" # Ensure the name is unique
  resource_group_name      = azurerm_resource_group.rg3.name
  location                 = azurerm_resource_group.rg3.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container2" {
  name                  = "tfstate-container-${random_string.rs.result}"
  storage_account_name  = azurerm_storage_account.sa2.name
  container_access_type = "private"
}

resource "azurerm_storage_share" "file_share" {
  name                 = "backend-tfstatefileshare"
  storage_account_name = azurerm_storage_account.sa2.name
  quota                = 50 # The maximum size of the share in GB
}