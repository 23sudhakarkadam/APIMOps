variable "apim_name" {
  description = "Name of the APIM service instance"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "admin_user_id" {
  description = "APIM user_id of the admin user (e.g. '1')"
  type        = string
}
