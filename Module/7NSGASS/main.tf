resource "azurerm_subnet_network_security_group_association" "nsgassblock" {
  for_each = var.nsgass
  subnet_id                 = data.azurerm_subnet.subet_data_block[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_data_block[each.key].id
}










