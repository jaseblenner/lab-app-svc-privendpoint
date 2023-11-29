output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "webapp_public_url" {
  value = "https://${azurerm_linux_web_app.webapp-public.default_hostname}"
}

output "webapp_public_privendpoint_url" {
  value = "https://${azurerm_linux_web_app.webapp-public-privendpoint.default_hostname}"
}