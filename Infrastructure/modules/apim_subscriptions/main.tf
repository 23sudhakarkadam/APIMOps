resource "azurerm_api_management_subscription" "starter" {
  allow_tracing       = false
  api_management_name = var.apim_name
  display_name        = "Starter Subscription"
  product_id          = var.starter_product_id
  resource_group_name = var.resource_group_name
  state               = "active"
  user_id             = var.admin_user_arm_id

  lifecycle {
    ignore_changes = [display_name]
  }
}

resource "azurerm_api_management_subscription" "unlimited" {
  allow_tracing       = false
  api_management_name = var.apim_name
  display_name        = "Unlimited Subscription"
  product_id          = var.unlimited_product_id
  resource_group_name = var.resource_group_name
  state               = "active"
  user_id             = var.admin_user_arm_id

  lifecycle {
    ignore_changes = [display_name]
  }
}
