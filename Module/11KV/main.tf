data "azurerm_client_config" "kv_block" {
}
resource "azurerm_key_vault" "kv_block" {
    for_each = var.kvs
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.kv_block.id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.kv_block.id
    object_id = data.azurerm_client_config.kv_block.id

    
}
}