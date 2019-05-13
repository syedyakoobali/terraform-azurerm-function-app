locals {
  storage_account_name = replace(
    lower(substr(var.name, 0, min(18, length(var.name)))),
    "/[^a-z0-9]/",
    "",
  )
}

resource "random_id" "main" {
  byte_length = 2
}

resource "azurerm_storage_account" "main" {
  name                     = format("%s%s", local.storage_account_name, random_id.main.hex)
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
  tags                     = var.tags
}

resource "azurerm_app_service_plan" "main" {
  name                = format("%s-plan", var.name)
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }

  tags = var.tags
}

resource "azurerm_function_app" "main" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_service_plan_id       = azurerm_app_service_plan.main.id
  storage_connection_string = azurerm_storage_account.main.primary_connection_string
  https_only                = var.https_only
  version                   = var.runtime_version
  client_affinity_enabled   = var.client_affinity_enabled

  site_config {
    always_on = var.always_on
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = var.app_settings

  tags = var.tags
}
