resource "azurerm_resource_group" "rg" {
  name     = "rg-mcatania-${var.env}-${var.loc}"
  location = var.location
}

# Infrastructure
module "st_terraform" {
  source                        = "./modules/storage-account"
  name                          = "stmcataniatf${var.env}${var.loc}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = true
  containers                    = ["tf-mcatania-container"]
}

# Clientside
module "st_clientside" {
  source                        = "./modules/storage-account"
  name                          = "stmcatania${var.env}${var.loc}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  account_tier                  = "Standard"
  account_replication_type      = "GRS"
  public_network_access_enabled = true
  static_website = [
    {
      index_document = "index.html"
    }
  ]
}

# Serverside
resource "azurerm_container_registry" "acr" {
  name                = "acrmcatania${var.env}${var.loc}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
}

module "aks" {
  source              = "./modules/aks"
  name                = "aks-mcatania-${var.env}-${var.loc}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = "mcatania"
  acr_id              = azurerm_container_registry.acr.id
}

# CDN
resource "azurerm_cdn_profile" "cdn" {
  name                = "cdnp-mcatania-${var.env}-global"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_Verizon"
}

resource "azurerm_cdn_endpoint" "endpoint" {
  name                = "matthewcatania"
  profile_name        = azurerm_cdn_profile.cdn.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  origin {
    name      = "default"
    host_name = "stmcataniatestwesteu.z6.web.core.windows.net"
  }
}