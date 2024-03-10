terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-mcatania-test-westeu"
    storage_account_name = "stmcataniatftestwesteu"
    container_name       = "tf-mcatania-container"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
