# ── Starter product ───────────────────────────────────────────────────────────

resource "azurerm_api_management_product" "starter" {
  api_management_name = var.apim_name
  description         = "Subscribers will be able to run 5 calls/minute up to a maximum of 100 calls/week."
  display_name        = "Starter"
  product_id          = "starter"
  published           = true
  resource_group_name = var.resource_group_name
  subscriptions_limit = 1
}

resource "azurerm_api_management_product_api" "starter_echo_api" {
  api_management_name = var.apim_name
  api_name            = "echo-api"
  product_id          = azurerm_api_management_product.starter.product_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_product_group" "starter_administrators" {
  api_management_name = var.apim_name
  group_name          = "administrators"
  product_id          = azurerm_api_management_product.starter.product_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_product_group" "starter_developers" {
  api_management_name = var.apim_name
  group_name          = "developers"
  product_id          = azurerm_api_management_product.starter.product_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_product_group" "starter_guests" {
  api_management_name = var.apim_name
  group_name          = "guests"
  product_id          = azurerm_api_management_product.starter.product_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_product_policy" "starter" {
  api_management_name = var.apim_name
  product_id          = azurerm_api_management_product.starter.product_id
  resource_group_name = var.resource_group_name
}

# ── Unlimited product ─────────────────────────────────────────────────────────

resource "azurerm_api_management_product" "unlimited" {
  api_management_name = var.apim_name
  approval_required   = true
  description         = "Subscribers have completely unlimited access to the API. Administrator approval is required."
  display_name        = "Unlimited"
  product_id          = "unlimited"
  published           = true
  resource_group_name = var.resource_group_name
  subscriptions_limit = 1
}

resource "azurerm_api_management_product_api" "unlimited_echo_api" {
  api_management_name = var.apim_name
  api_name            = "echo-api"
  product_id          = azurerm_api_management_product.unlimited.product_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_product_group" "unlimited_administrators" {
  api_management_name = var.apim_name
  group_name          = "administrators"
  product_id          = azurerm_api_management_product.unlimited.product_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_product_group" "unlimited_developers" {
  api_management_name = var.apim_name
  group_name          = "developers"
  product_id          = azurerm_api_management_product.unlimited.product_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_product_group" "unlimited_guests" {
  api_management_name = var.apim_name
  group_name          = "guests"
  product_id          = azurerm_api_management_product.unlimited.product_id
  resource_group_name = var.resource_group_name
}
