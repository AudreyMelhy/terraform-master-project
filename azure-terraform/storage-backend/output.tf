output "storage_account_name" {
  value = azurerm_storage_account.sa2.name
}

output "container_name" {
  value = azurerm_storage_container.container2.name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg3.name
}

output "file_share_name" {
  value = azurerm_storage_share.file_share.name
}