resource "azurerm_resource_group" "rg" {
  name     = "rg-mcatania-${var.env}-${var.loc}"
  location = var.location
}

module "st_terraform" {
  source                        = "./modules/storage-account"
  name                          = "stmcataniaterraform${var.env}${var.loc}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = true
  containers                    = ["tf-mcatania-container"]
}