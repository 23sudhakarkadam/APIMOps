resource "azurerm_api_management_group" "administrators" {
  api_management_name = var.apim_name
  description         = "Administrators is a built-in group containing the admin email account provided at the time of service creation. Its membership is managed by the system."
  display_name        = "Administrators"
  name                = "administrators"
  resource_group_name = var.resource_group_name
  type                = "system"
}

resource "azurerm_api_management_group_user" "administrators_admin" {
  api_management_name = var.apim_name
  group_name          = azurerm_api_management_group.administrators.name
  resource_group_name = var.resource_group_name
  user_id             = var.admin_user_id
}

resource "azurerm_api_management_group" "developers" {
  api_management_name = var.apim_name
  description         = "Developers is a built-in group. Its membership is managed by the system. Signed-in users fall into this group."
  display_name        = "Developers"
  name                = "developers"
  resource_group_name = var.resource_group_name
  type                = "system"
}

resource "azurerm_api_management_group_user" "developers_admin" {
  api_management_name = var.apim_name
  group_name          = azurerm_api_management_group.developers.name
  resource_group_name = var.resource_group_name
  user_id             = var.admin_user_id
}

resource "azurerm_api_management_group" "guests" {
  api_management_name = var.apim_name
  description         = "Guests is a built-in group. Its membership is managed by the system. Unauthenticated users visiting the developer portal fall into this group."
  display_name        = "Guests"
  name                = "guests"
  resource_group_name = var.resource_group_name
  type                = "system"
}
