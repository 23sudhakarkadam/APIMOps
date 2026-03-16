variable "apim_name" {
  description = "Name of the APIM service instance"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "backend_url" {
  description = "URL of the backend service"
  type        = string
}
