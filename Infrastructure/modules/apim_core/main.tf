resource "azurerm_resource_group" "this" {
  location = var.location
  name     = var.resource_group_name
}

resource "azurerm_api_management" "this" {
  location            = var.location
  name                = var.apim_name
  publisher_email     = var.publisher_email
  publisher_name      = var.publisher_name
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = var.sku_name
}

# Managed by ApiOps (artifacts/policy.xml)
resource "azurerm_api_management_policy" "global" {
  api_management_id = azurerm_api_management.this.id
  xml_content       = <<-XML
    <!--
        IMPORTANT:
        - Policy elements can appear only within the <inbound>, <outbound>, <backend> section elements.
        - Only the <forward-request> policy element can appear within the <backend> section element.
        - To apply a policy to the incoming request (before it is forwarded to the backend service), place a corresponding policy element within the <inbound> section element.
        - To apply a policy to the outgoing response (before it is sent back to the caller), place a corresponding policy element within the <outbound> section element.
        - To add a policy position the cursor at the desired insertion point and click on the round button associated with the policy.
        - To remove a policy, delete the corresponding policy statement from the policy document.
        - Policies are applied in the order of their appearance, from the top down.
    -->
    <policies>
      <inbound />
      <backend>
        <forward-request />
      </backend>
      <outbound />
    </policies>
  XML
}

resource "azurerm_api_management_user" "admin" {
  api_management_name = azurerm_api_management.this.name
  email               = var.admin_email
  first_name          = "Administrator"
  last_name           = "Admin"
  resource_group_name = azurerm_resource_group.this.name
  user_id             = "1"

  lifecycle {
    ignore_changes = [last_name]
  }
}
