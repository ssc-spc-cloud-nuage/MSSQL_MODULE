#Storage Accounts
resource "azurerm_storage_account" "mssql" {
  name                            = "${var.environment}${var.server["sqlname"]}"
  location                        = var.location
  resource_group_name             = var.server["resource_group_name"]
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  min_tls_version                 = var.min_tls_version
}
