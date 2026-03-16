resource "azurerm_api_management_backend" "my_app_backend" {
  api_management_name = var.apim_name
  name                = "my-app-backend"
  protocol            = "http"
  resource_group_name = var.resource_group_name
  url                 = var.backend_url

  tls {
    validate_certificate_chain = true
    validate_certificate_name  = true
  }

  lifecycle {
    ignore_changes = [credentials]
  }
}
