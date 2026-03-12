variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "apim_name" {
  description = "Name of the APIM service instance"
  type        = string
}

variable "publisher_email" {
  description = "Publisher email address for the APIM service"
  type        = string
}

variable "publisher_name" {
  description = "Publisher display name for the APIM service"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the APIM service (e.g. Developer_1, Standard_1)"
  type        = string
  default     = "Developer_1"
}

variable "admin_email" {
  description = "Email address of the built-in administrator user"
  type        = string
}

# Managed by ApiOps (artifacts/named values/) — no longer used by Terraform
# variable "named_value" {
#   description = "Value for the 'Named' named value"
#   type        = string
#   default     = "PROD"
# }
