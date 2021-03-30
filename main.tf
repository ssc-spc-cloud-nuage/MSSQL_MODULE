terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.52.0"
    }
  }
}



resource "azurerm_mssql_server" "mssql" {  
  name                          = "${var.environment}-cio-${var.sqlname}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  version                       = var.mssql_version
  administrator_login           = var.administrator_login
  administrator_login_password  = var.administrator_login_password
  public_network_access_enabled = false  

  azuread_administrator {
    login_username =   "louis-eric.tremblay@ssc-spc.gc.ca"
    tenant_id           = var.active_directory_administrator_tenant_id
    object_id           = var.active_directory_administrator_object_id
  }
}

resource "azurerm_mssql_database" "mssql" {          
    name           = "${var.environment}-cio-${var.sqldbname}"
    server_id      = azurerm_mssql_server.mssql.id
    collation      = var.collation
    license_type = "LicenseIncluded"
    max_size_gb    = var.max_size_gb
    read_scale     = var.read_scale
    sku_name       = var.sku_name
    zone_redundant = var.zone_redundant

    short_term_retention_policy {
      retention_days = var.policyretention_days
    }
    
    dynamic "long_term_retention_policy" {
      for_each = var.week_of_year == null ? [] : [var.week_of_year]
      content {
        weekly_retention = var.weekly_retention
        monthly_retention = var.monthly_retention
        yearly_retention = var.yearly_retention
        week_of_year =  var.week_of_year
      }
    }
}

resource   "azurerm_mssql_server_extended_auditing_policy" "mssql" { 
  server_id                               = azurerm_mssql_server.mssql.id
  storage_endpoint                        = azurerm_storage_account.mssql.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.mssql.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 6
} 

resource "azurerm_mssql_server_security_alert_policy" "mssql" {  
  resource_group_name        = var.resource_group_name
  server_name                =  azurerm_mssql_server.mssql.name
  state                      = "Enabled"
  storage_endpoint           = azurerm_storage_account.mssql.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.mssql.primary_access_key
  email_account_admins       = true
  disabled_alerts = [    
    "Data_Exfiltration"
  ]
  retention_days = 30
}

# resource "azurerm_sql_active_directory_administrator" "mssql" {  
#   server_name         = azurerm_mssql_server.mssql.name
#   resource_group_name = var.resource_group_name
#   login               = "louis-eric.tremblay@ssc-spc.gc.ca"
#   tenant_id           = var.active_directory_administrator_tenant_id
#   object_id           = var.active_directory_administrator_object_id
# }

resource "azurerm_private_endpoint" "mssql" { 
  name                = "${var.environment}-cio-${var.sqlname}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name //"ScDc-CIO_APS_Network-rg"
  subnet_id           = var.subnet_id

  private_dns_zone_group {
    name = "${var.sqlname}privatednszonegroup"
    private_dns_zone_ids = [var.DnsPrivatezoneId]
  }

  private_service_connection {   
    name                           = "${var.environment}-cio-${var.sqlname}-psc"
    private_connection_resource_id =  azurerm_mssql_server.mssql.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
}

# output "private_link_endpoint_ip03" {
#   value = "${azurerm_private_endpoint.CIO-vcboardroom-pe.private_service_connection.0.private_ip_address}"
#}