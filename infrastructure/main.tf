# 1. Create the Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location
}

# 2. Create the Random String (Azure Storage names must be unique globally)
resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}

# 3. Create the Storage Account for the Website
resource "azurerm_storage_account" "static_site" {
  name                     = "st${var.environment}${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # This enables the "Static Website" feature
  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }
}

# 4. Output the Web Address (So we know where to click)
output "website_url" {
  value = azurerm_storage_account.static_site.primary_web_endpoint
}