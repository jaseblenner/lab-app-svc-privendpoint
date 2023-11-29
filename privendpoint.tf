resource "azurerm_private_endpoint" "privendpoint" {
  name                = "privendpoint-${azurerm_linux_web_app.webapp-public-privendpoint.name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.private_endpoints.id

  private_service_connection {
    name                           = "privscvconn-${azurerm_linux_web_app.webapp-public-privendpoint.name}"
    private_connection_resource_id = azurerm_linux_web_app.webapp-public-privendpoint.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = azurerm_private_dns_zone.appservice.name
    private_dns_zone_ids = [azurerm_private_dns_zone.appservice.id]
  }
}