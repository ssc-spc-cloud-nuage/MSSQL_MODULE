# Storage Accounts
resource "azurerm_storage_account" "mssql" {
  name                      = "${var.environment}cioapsvcboardroomsa"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}