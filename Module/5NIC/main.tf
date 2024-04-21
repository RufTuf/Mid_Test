resource "azurerm_network_interface" "nicblock" {
  for_each = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "kapil_nic"
    subnet_id                     = data.azurerm_subnet.subet_data_block[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip_data_block[each.key].id
  }
}



