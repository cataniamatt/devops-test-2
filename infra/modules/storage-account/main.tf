resource "azurerm_storage_account" "st" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  public_network_access_enabled = var.public_network_access_enabled
}

resource "azurerm_storage_container" "container" {
  for_each              = { for idx, container in var.containers : container => container }
  name                  = each.value
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}

resource "azurerm_storage_queue" "queue" {
  for_each             = { for idx, queue in var.queues : queue => queue }
  name                 = each.value
  storage_account_name = azurerm_storage_account.st.name
}

resource "azurerm_storage_table" "table" {
  for_each             = { for idx, table in var.tables : table => table }
  name                 = each.value
  storage_account_name = azurerm_storage_account.st.name
}