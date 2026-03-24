variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "APIM_Ops"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "centralindia"
}

variable "apim_name" {
  description = "Name of the APIM service instance"
  type        = string
  default     = "apimops"
}

variable "publisher_email" {
  description = "Publisher email address for the APIM service"
  type        = string
  default     = "sudhakar.kadam@nusummit.com"
}

variable "publisher_name" {
  description = "Publisher display name for the APIM service"
  type        = string
  default     = "apimops"
}

variable "sku_name" {
  description = "SKU name for the APIM service (e.g. Developer_1, Standard_1)"
  type        = string
  default     = "Developer_1"
}

variable "admin_email" {
  description = "Email address of the built-in administrator user"
  type        = string
  default     = "sudhakar.kadam@nusummit.com"
}


variable "backend_url" {
  description = "URL of the my-app-backend service"
  type        = string
  default     = "https://10.10.10.10"
}


variable "named_value" {
  description = "Value for the 'Named' named value"
  type        = string
  default     = "PROD"
}
