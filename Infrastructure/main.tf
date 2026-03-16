module "apim_core" {
  source = "./modules/apim_core"

  location            = var.location
  resource_group_name = var.resource_group_name
  apim_name           = var.apim_name
  publisher_email     = var.publisher_email
  publisher_name      = var.publisher_name
  sku_name            = var.sku_name
  admin_email         = var.admin_email
  # named_value       = var.named_value  # Managed by ApiOps (named values/)
}


module "apim_core_prod" {
  source = "./modules/apim_core"

  location            = var.location
  resource_group_name = "APIM_Ops_Prod"
  apim_name           = "apiops-prod"
  publisher_email     = var.publisher_email
  publisher_name      = var.publisher_name
  sku_name            = var.sku_name
  admin_email         = var.admin_email
  # named_value       = var.named_value  # Managed by ApiOps (named values/)
}


# Managed by ApiOps (artifacts/apis/)
# module "apim_apis" {
#   source = "./modules/apim_apis"
#   apim_name           = module.apim_core.apim_name
#   resource_group_name = module.apim_core.resource_group_name
#   apim_id             = module.apim_core.apim_id
# }

# Managed by ApiOps (artifacts/backends/)
# module "apim_backend" {
#   source = "./modules/apim_backend"
#   apim_name           = module.apim_core.apim_name
#   resource_group_name = module.apim_core.resource_group_name
#   backend_url         = var.backend_url
# }

# Managed by ApiOps (artifacts/groups/)
# module "apim_groups" {
#   source = "./modules/apim_groups"
#   apim_name           = module.apim_core.apim_name
#   resource_group_name = module.apim_core.resource_group_name
#   admin_user_id       = module.apim_core.admin_user_id
# }

# Managed by ApiOps (artifacts/products/)
# module "apim_products" {
#   source = "./modules/apim_products"
#   apim_name           = module.apim_core.apim_name
#   resource_group_name = module.apim_core.resource_group_name
#   depends_on = [module.apim_apis, module.apim_groups]
# }

# Managed by ApiOps (artifacts/subscriptions/)
# module "apim_subscriptions" {
#   source = "./modules/apim_subscriptions"
#   apim_name            = module.apim_core.apim_name
#   resource_group_name  = module.apim_core.resource_group_name
#   starter_product_id   = module.apim_products.starter_product_id
#   unlimited_product_id = module.apim_products.unlimited_product_id
#   admin_user_arm_id    = module.apim_core.admin_user_arm_id
# }

module "apim_email_templates" {
  source = "./modules/apim_email_templates"

  apim_name           = module.apim_core.apim_name
  resource_group_name = module.apim_core.resource_group_name
}
