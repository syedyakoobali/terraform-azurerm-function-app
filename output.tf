output "identity" {
  description = "The MSI identity set on the function app."
  value       = "${azurerm_function_app.functionapp.identity}"
}

