variable "apim_name" {
  description = "Name of the APIM service instance"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "apim_id" {
  description = "ARM resource ID of the APIM service (used for implicit dependency ordering)"
  type        = string
}
