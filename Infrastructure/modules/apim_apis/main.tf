locals {
  enterprise_schema_id = "6995af054634611bccfe9053"
  sample_schema_id     = "69ac60b146346117bc84b487"
}

# ── echo-api ──────────────────────────────────────────────────────────────────

resource "azurerm_api_management_api" "echo_api" {
  api_management_name = var.apim_name
  name                = "echo-api"
  display_name        = "Echo API"
  path                = "echo"
  protocols           = ["https"]
  service_url         = "https://echo.playground.azure-api.net/api"
  resource_group_name = var.resource_group_name
  revision            = "1"
}

resource "azurerm_api_management_api_operation" "echo_api_create_resource" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  description         = "A demonstration of a POST call based on the echo backend above. The request body is expected to contain JSON-formatted data (see example below). A policy is used to automatically transform any request sent in JSON directly to XML. In a real-world scenario this could be used to enable modern clients to speak to a legacy backend."
  display_name        = "Create resource"
  method              = "POST"
  operation_id        = "create-resource"
  resource_group_name = var.resource_group_name
  url_template        = "/resource"
  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation_policy" "echo_api_create_resource" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  operation_id        = azurerm_api_management_api_operation.echo_api_create_resource.operation_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_api_operation" "echo_api_modify_resource" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  description         = "A demonstration of a PUT call handled by the same \"echo\" backend as above. You can now specify a request body in addition to headers and it will be returned as well."
  display_name        = "Modify Resource"
  method              = "PUT"
  operation_id        = "modify-resource"
  resource_group_name = var.resource_group_name
  url_template        = "/resource"
  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "echo_api_remove_resource" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  description         = "A demonstration of a DELETE call which traditionally deletes the resource. It is based on the same \"echo\" backend as in all other operations so nothing is actually deleted."
  display_name        = "Remove resource"
  method              = "DELETE"
  operation_id        = "remove-resource"
  resource_group_name = var.resource_group_name
  url_template        = "/resource"
  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "echo_api_retrieve_header_only" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  description         = "The HEAD operation returns only headers. In this demonstration a policy is used to set additional headers when the response is returned and to enable JSONP."
  display_name        = "Retrieve header only"
  method              = "HEAD"
  operation_id        = "retrieve-header-only"
  resource_group_name = var.resource_group_name
  url_template        = "/resource"
  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation_policy" "echo_api_retrieve_header_only" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  operation_id        = azurerm_api_management_api_operation.echo_api_retrieve_header_only.operation_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_api_management_api_operation" "echo_api_retrieve_resource" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  description         = "A demonstration of a GET call on a sample resource. It is handled by an \"echo\" backend which returns a response equal to the request (the supplied headers and body are being returned as received)."
  display_name        = "Retrieve resource"
  method              = "GET"
  operation_id        = "retrieve-resource"
  resource_group_name = var.resource_group_name
  url_template        = "/resource"
  response {
    description = "Returned in all cases."
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "echo_api_retrieve_resource_cached" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  description         = "A demonstration of a GET call with caching enabled on the same \"echo\" backend as above. Cache TTL is set to 1 hour. When you make the first request the headers you supplied will be cached. Subsequent calls will return the same headers as the first time even if you change them in your request."
  display_name        = "Retrieve resource (cached)"
  method              = "GET"
  operation_id        = "retrieve-resource-cached"
  resource_group_name = var.resource_group_name
  url_template        = "/resource-cached"
  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation_policy" "echo_api_retrieve_resource_cached" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.echo_api.name
  operation_id        = azurerm_api_management_api_operation.echo_api_retrieve_resource_cached.operation_id
  resource_group_name = var.resource_group_name
}

# ── enterprise-management-api ─────────────────────────────────────────────────

resource "azurerm_api_management_api" "enterprise_management_api" {
  api_management_name = var.apim_name
  name                = "enterprise-management-api"
  display_name        = "Enterprise Management API"
  protocols           = ["https"]
  service_url         = "https://api.contoso.com/v1"
  resource_group_name = var.resource_group_name
  revision            = "1"
}

resource "azurerm_api_management_api_schema" "enterprise_management_api" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  content_type        = "application/vnd.oai.openapi.components+json"
  resource_group_name = var.resource_group_name
  schema_id           = local.enterprise_schema_id
  components = jsonencode({
    schemas = {
      ErrorResponse = {
        properties = {
          code    = { type = "string" }
          message = { type = "string" }
        }
        type = "object"
      }
      Order = {
        properties = {
          id          = { type = "string" }
          totalAmount = { type = "number" }
          userId      = { type = "string" }
        }
        type = "object"
      }
      Orders-id-OperationsRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Product = {
        properties = {
          id    = { type = "string" }
          name  = { type = "string" }
          price = { type = "number" }
        }
        type = "object"
      }
      Products-id-OperationsRequest = {
        type          = "string"
        x-apim-inline = true
      }
      User = {
        properties = {
          email = { type = "string" }
          id    = { type = "string" }
          name  = { type = "string" }
        }
        type = "object"
      }
      Users-id-OperationsRequest = {
        type          = "string"
        x-apim-inline = true
      }
      UsersGet200ApplicationJsonResponse = {
        items         = { "$ref" = "#/components/schemas/User" }
        type          = "array"
        x-apim-inline = true
      }
    }
  })
}

resource "azurerm_api_management_api_operation" "enterprise_api_delete_user" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Delete user"
  display_name        = "Delete user"
  method              = "DELETE"
  operation_id        = "delete-users-id"
  resource_group_name = var.resource_group_name
  url_template        = "/users/{id}"
  response {
    description = "Deleted successfully"
    status_code = 204
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = local.enterprise_schema_id
    type      = "string"
    type_name = "Users-id-OperationsRequest"
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_get_audit_logs" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Get audit logs"
  display_name        = "Get audit logs"
  method              = "GET"
  operation_id        = "get-audit-logs"
  resource_group_name = var.resource_group_name
  url_template        = "/audit/logs"
  response {
    description = "OK"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_get_health" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Health check"
  display_name        = "Health check"
  method              = "GET"
  operation_id        = "get-health"
  resource_group_name = var.resource_group_name
  url_template        = "/health"
  response {
    description = "Service healthy"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_get_inventory" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Get inventory"
  display_name        = "Get inventory"
  method              = "GET"
  operation_id        = "get-inventory"
  resource_group_name = var.resource_group_name
  url_template        = "/inventory"
  response {
    description = "OK"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_list_orders" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "List orders"
  display_name        = "List orders"
  method              = "GET"
  operation_id        = "get-orders"
  resource_group_name = var.resource_group_name
  url_template        = "/orders"
  response {
    description = "OK"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_get_order" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Get order"
  display_name        = "Get order"
  method              = "GET"
  operation_id        = "get-orders-id"
  resource_group_name = var.resource_group_name
  url_template        = "/orders/{id}"
  response {
    description = "OK"
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = local.enterprise_schema_id
    type      = "string"
    type_name = "Orders-id-OperationsRequest"
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_get_products" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Get products"
  display_name        = "Get products"
  method              = "GET"
  operation_id        = "get-products"
  resource_group_name = var.resource_group_name
  url_template        = "/products"
  response {
    description = "OK"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_get_product" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Get product"
  display_name        = "Get product"
  method              = "GET"
  operation_id        = "get-products-id"
  resource_group_name = var.resource_group_name
  url_template        = "/products/{id}"
  response {
    description = "OK"
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = local.enterprise_schema_id
    type      = "string"
    type_name = "Products-id-OperationsRequest"
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_sales_report" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Sales report"
  display_name        = "Sales report"
  method              = "GET"
  operation_id        = "get-reports-sales"
  resource_group_name = var.resource_group_name
  url_template        = "/reports/sales"
  response {
    description = "OK"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_get_users" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Get all users"
  display_name        = "Get all users"
  method              = "GET"
  operation_id        = "get-users"
  resource_group_name = var.resource_group_name
  url_template        = "/users"
  response {
    description = "Successful response"
    status_code = 200
    representation {
      content_type = "application/json"
      schema_id    = local.enterprise_schema_id
      type_name    = "UsersGet200ApplicationJsonResponse"
      example {
        name = "default"
        value = jsonencode([{
          email = "string"
          id    = "string"
          name  = "string"
        }])
      }
    }
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_get_user" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Get user by ID"
  display_name        = "Get user by ID"
  method              = "GET"
  operation_id        = "get-users-id"
  resource_group_name = var.resource_group_name
  url_template        = "/users/{id}"
  response {
    description = "Successful response"
    status_code = 200
    representation {
      content_type = "application/json"
      schema_id    = local.enterprise_schema_id
      type_name    = "User"
      example {
        name = "default"
        value = jsonencode({
          email = "string"
          id    = "string"
          name  = "string"
        })
      }
    }
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = local.enterprise_schema_id
    type      = "string"
    type_name = "Users-id-OperationsRequest"
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_update_inventory" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Update inventory"
  display_name        = "Update inventory"
  method              = "PATCH"
  operation_id        = "patch-inventory"
  resource_group_name = var.resource_group_name
  url_template        = "/inventory"
  response {
    description = "Updated"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_update_order" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Update order"
  display_name        = "Update order"
  method              = "PATCH"
  operation_id        = "patch-orders-id"
  resource_group_name = var.resource_group_name
  url_template        = "/orders/{id}"
  response {
    description = "Updated"
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = local.enterprise_schema_id
    type      = "string"
    type_name = "Orders-id-OperationsRequest"
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_update_user" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Update user"
  display_name        = "Update user"
  method              = "PATCH"
  operation_id        = "patch-users-id"
  resource_group_name = var.resource_group_name
  url_template        = "/users/{id}"
  response {
    description = "Updated successfully"
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = local.enterprise_schema_id
    type      = "string"
    type_name = "Users-id-OperationsRequest"
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_generate_token" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Generate token"
  display_name        = "Generate token"
  method              = "POST"
  operation_id        = "post-auth-token"
  resource_group_name = var.resource_group_name
  url_template        = "/auth/token"
  response {
    description = "Token generated"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_send_notification" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Send notification"
  display_name        = "Send notification"
  method              = "POST"
  operation_id        = "post-notifications"
  resource_group_name = var.resource_group_name
  url_template        = "/notifications"
  response {
    description = "Accepted"
    status_code = 202
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_create_order" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Create order"
  display_name        = "Create order"
  method              = "POST"
  operation_id        = "post-orders"
  resource_group_name = var.resource_group_name
  url_template        = "/orders"
  response {
    description = "Created"
    status_code = 201
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_process_payment" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Process payment"
  display_name        = "Process payment"
  method              = "POST"
  operation_id        = "post-payments"
  resource_group_name = var.resource_group_name
  url_template        = "/payments"
  response {
    description = "Payment processed"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_create_product" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Create product"
  display_name        = "Create product"
  method              = "POST"
  operation_id        = "post-products"
  resource_group_name = var.resource_group_name
  url_template        = "/products"
  response {
    description = "Created"
    status_code = 201
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_create_user" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Create user"
  display_name        = "Create user"
  method              = "POST"
  operation_id        = "post-users"
  resource_group_name = var.resource_group_name
  url_template        = "/users"
  response {
    description = "User created"
    status_code = 201
  }
}

resource "azurerm_api_management_api_operation" "enterprise_api_replace_product" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.enterprise_management_api.name
  description         = "Replace product"
  display_name        = "Replace product"
  method              = "PUT"
  operation_id        = "put-products-id"
  resource_group_name = var.resource_group_name
  url_template        = "/products/{id}"
  response {
    description = "Updated"
    status_code = 200
  }
  template_parameter {
    name      = "id"
    required  = true
    schema_id = local.enterprise_schema_id
    type      = "string"
    type_name = "Products-id-OperationsRequest"
  }
}

# ── sample-utility-api ────────────────────────────────────────────────────────

resource "azurerm_api_management_api" "sample_utility_api" {
  api_management_name = var.apim_name
  name                = "sample-utility-api"
  display_name        = "Sample Utility API"
  description         = "Sample API set with 5 endpoints for Azure API Management import"
  path                = "utilityapi"
  protocols           = ["https"]
  service_url         = "https://example-backend.azurewebsites.net/"
  resource_group_name = var.resource_group_name
  revision            = "1"
}

resource "azurerm_api_management_api_schema" "sample_utility_api" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.sample_utility_api.name
  content_type        = "application/vnd.oai.openapi.components+json"
  resource_group_name = var.resource_group_name
  schema_id           = local.sample_schema_id
  components = jsonencode({
    schemas = {
      User = {
        properties = {
          email = { type = "string" }
          id    = { type = "string" }
          name  = { type = "string" }
        }
        type = "object"
      }
      Users-userId-DeleteRequest = {
        type          = "string"
        x-apim-inline = true
      }
      Users-userId-GetRequest = {
        type          = "string"
        x-apim-inline = true
      }
    }
  })
}

resource "azurerm_api_management_api_operation" "sample_api_create_user" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.sample_utility_api.name
  description         = "Create user"
  display_name        = "Create user"
  method              = "POST"
  operation_id        = "createUser"
  resource_group_name = var.resource_group_name
  url_template        = "/users"
  response {
    description = "User created"
    status_code = 201
  }
}

resource "azurerm_api_management_api_operation" "sample_api_delete_user" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.sample_utility_api.name
  description         = "Delete user"
  display_name        = "Delete user"
  method              = "DELETE"
  operation_id        = "deleteUser"
  resource_group_name = var.resource_group_name
  url_template        = "/users/{userId}"
  response {
    description = "User deleted"
    status_code = 204
  }
  template_parameter {
    name      = "userId"
    required  = true
    schema_id = local.sample_schema_id
    type      = "string"
    type_name = "Users-userId-DeleteRequest"
  }
}

resource "azurerm_api_management_api_operation" "sample_api_get_health" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.sample_utility_api.name
  description         = "Health check"
  display_name        = "Health check"
  method              = "GET"
  operation_id        = "getHealth"
  resource_group_name = var.resource_group_name
  url_template        = "/health"
  response {
    description = "Service is healthy"
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation" "sample_api_get_user_by_id" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.sample_utility_api.name
  description         = "Get user by ID"
  display_name        = "Get user by ID"
  method              = "GET"
  operation_id        = "getUserById"
  resource_group_name = var.resource_group_name
  url_template        = "/users/{userId}"
  response {
    description = "User details"
    status_code = 200
  }
  template_parameter {
    name      = "userId"
    required  = true
    schema_id = local.sample_schema_id
    type      = "string"
    type_name = "Users-userId-GetRequest"
  }
}

resource "azurerm_api_management_api_operation" "sample_api_get_users" {
  api_management_name = var.apim_name
  api_name            = azurerm_api_management_api.sample_utility_api.name
  description         = "Get all users"
  display_name        = "Get all users"
  method              = "GET"
  operation_id        = "getUsers"
  resource_group_name = var.resource_group_name
  url_template        = "/users"
  response {
    description = "List of users"
    status_code = 200
  }
}
