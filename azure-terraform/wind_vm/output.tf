output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "admin_username" {
  value = azurerm_windows_virtual_machine.vm.admin_username
}

output "vm_id" {
  value = azurerm_windows_virtual_machine.vm.id
}

output "network_security_group" {
  value = azurerm_network_security_group.nsg.name
}
