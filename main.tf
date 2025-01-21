provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "mymonthe"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "12345monthe"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "mycontainer"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
