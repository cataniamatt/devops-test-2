resource "azurerm_resource_group" "rg" {
  name     = "rg-mcatania-backend-${var.env}-${var.loc}"
  location = var.location
}