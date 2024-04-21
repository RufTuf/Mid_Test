data "azurerm_public_ip" "pip_data_block" {
  for_each            = var.lbs
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}