terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "c1bc0160-d4e3-463a-89a2-97c580287670"
}




resource "azurerm_resource_group" "example_resource_group" {
  name     = "example-resource-group"
  location = "francecentral"
}

resource "azurerm_mssql_server" "example" {
  name                         = "raffaeleserver22200323"
  resource_group_name          = azurerm_resource_group.example_resource_group.name
  location                     = azurerm_resource_group.example_resource_group.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "Napoli8089.."
}

resource "azurerm_mssql_database" "example" {
  name      = "exampledb"
  server_id = azurerm_mssql_server.example.id
  sku_name  = "S0"

  depends_on = [
    azurerm_mssql_server.example
  ]
}

