variable "apim_name" {
  description = "Name of the APIM service instance"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "starter_product_id" {
  description = "ARM resource ID of the Starter product"
  type        = string
}

variable "unlimited_product_id" {
  description = "ARM resource ID of the Unlimited product"
  type        = string
}

variable "admin_user_arm_id" {
  description = "ARM resource ID of the admin user"
  type        = string
}
