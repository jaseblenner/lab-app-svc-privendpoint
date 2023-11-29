# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "app-service-plan-${var.lab_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

data "archive_file" "python-app" {
  type        = "zip"
  source_dir  = "${path.module}/app/python-app/"
  output_path = "${path.module}/app/python-app.zip"
}

resource "azurerm_linux_web_app" "webapp-public" {
  name                      = "webapp-public-${var.lab_name}"
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  service_plan_id           = azurerm_service_plan.appserviceplan.id
  virtual_network_subnet_id = azurerm_subnet.public.id

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE       = "1"
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
  }

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  zip_deploy_file = "${path.module}/app/python-app.zip"
}

resource "azurerm_linux_web_app" "webapp-public-privendpoint" {
  name                = "webapp-public-privendpoint-${var.lab_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.appserviceplan.id
  virtual_network_subnet_id = azurerm_subnet.public.id

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE       = "1"
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
  }

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }

  zip_deploy_file = "${path.module}/app/python-app.zip"

}
