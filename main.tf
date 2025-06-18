provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg"
  location = "EAST-US"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "app_service_plan"
  location            = EAST-US
  resource_group_name = rg
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "webapp-kaushik"
  location            = EAST-US
  resource_group_name = RG
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }
}
