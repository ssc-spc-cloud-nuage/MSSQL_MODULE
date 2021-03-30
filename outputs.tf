output "id" {
  value = azurerm_mssql_server.mssql.id
}

output "name" {
  value = azurerm_mssql_server.mssql.name
}

output "administrator_login" {
  value = azurerm_mssql_server.mssql.administrator_login
}

output "active_directory_administrator_tenant_id" {
  value = azurerm_sql_active_directory_administrator.mssql.active_directory_administrator_tenant_id
}
output "active_directory_administrator_object_id" {
  value = azurerm_sql_active_directory_administrator.mssql.active_directory_administrator_object_id
}

# Part of a hack for module-to-module dependencies.
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-449158607
# and
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-473091030
# output "depended_on" {
#   value = "${null_resource.dependency_setter.id}-${timestamp()}"
# }