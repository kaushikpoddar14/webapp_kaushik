provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg"
  location = "EAST-US"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "app_service_plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "app_service_name"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }
}
