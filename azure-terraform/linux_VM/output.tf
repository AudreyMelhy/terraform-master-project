output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "admin_username" {
  value = azurerm_linux_virtual_machine.vm.admin_username
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}
