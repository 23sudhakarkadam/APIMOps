output "apim_gateway_url" {
  description = "Gateway URL of the APIM service"
  value       = "https://${module.apim_core.apim_name}.azure-api.net"
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.apim_core.resource_group_name
}

output "apim_name" {
  description = "Name of the APIM service"
  value       = module.apim_core.apim_name
}
