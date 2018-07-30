# terraform-azurerm-function-app

## Create a Function App in Azure

This terraform module deploys a Function App on dedicated app service plan, with autoscaling, in Azure.

## Usage

```hcl

resource "azurerm_resource_group" "image_resizer" {
  name     = "image-resizer-func-rg"
  location = "westeurope"
}

module "function_app" {
  source              = "github.com/innovationnorway/terraform-azurerm-function-app"
  function_app_name   = "image-resizer-func"
  resource_group_name = "${azurerm_resource_group.image_resizer.name}"
  location            = "${azurerm_resource_group.image_resizer.location}"
  environment         = "lab"
  function_verion     = "beta"
  
  app_settings {
    "FUNCTIONS_WORKER_RUNTIME" = "dotnet"
  }

  tags {
      a       = "b",
      release = "release 2018-07-21.001"
  }
}

```
