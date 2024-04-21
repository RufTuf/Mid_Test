resource "azurerm_bastion_host" "bs_block" {
    for_each = var.bshost
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subet_data_block[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_data_block[each.key].id
  }
}



