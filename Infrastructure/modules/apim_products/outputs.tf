output "starter_product_id" {
  description = "ARM resource ID of the Starter product"
  value       = azurerm_api_management_product.starter.id
}

output "unlimited_product_id" {
  description = "ARM resource ID of the Unlimited product"
  value       = azurerm_api_management_product.unlimited.id
}
