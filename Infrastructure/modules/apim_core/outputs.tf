output "apim_id" {
  description = "ARM resource ID of the APIM service"
  value       = azurerm_api_management.this.id
}

output "apim_name" {
  description = "Name of the APIM service"
  value       = azurerm_api_management.this.name
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.this.name
}

# Used by apim_groups (now commented out — managed by ApiOps)
# output "admin_user_id" {
#   description = "APIM user_id of the admin user (used by group_user resources)"
#   value       = azurerm_api_management_user.admin.user_id
# }

# Used by apim_subscriptions (now commented out — managed by ApiOps)
# output "admin_user_arm_id" {
#   description = "ARM resource ID of the admin user (used by subscription resources)"
#   value       = azurerm_api_management_user.admin.id
# }
