output "identity" {
  description = "The MSI identity set on the function app."
  value       = "${azurerm_function_app.functionapp.identity}"
}

output "app_service_plan" {
  description = "The exported values from the app service plan."
  value = "${azurerm_app_service_plan.serviceplan}"
}

output "storage_account" {
  description = "The exported values from the storage account."
  value = "${azurerm_storage_account.funcsta}"
}

output "function_app" {
  description = "The exported values from the function app."
  value = "${azurerm_function_app.functionapp}"
}

output "auto_scale_settings" {
  description = "The exported values from the auto scale settings."
  value = "${azurerm_autoscale_setting.app_service_auto_scale}"
}

