resource "azurerm_subnet" "subentblock" {
  for_each = var.subnets
  name                 = "internal"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
}



