resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.lab_name}"
  location = var.resource_group_location
}