# Storage Accounts
resource "azurerm_storage_account" "mssql" {

    for_each = [for s in var.server : {
      name                          = "${var.environment}-cio-${s.sqlname}"
      location                      = s.location
      resource_group_name           = s.resource_group_name
      account_tier              = "Standard"
      account_replication_type  = "LRS"
    }]
    content {
      name                          = "${var.environment}-cio-${server.value.sqlname}"
      location                      = server.value.location
      resource_group_name           = server.value.resource_group_name
      account_tier              = "Standard"
      account_replication_type  = "LRS"
    }    

}