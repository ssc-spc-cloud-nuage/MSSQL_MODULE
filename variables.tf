# Server

variable "server" {
  description = "The name of the MSSQL Server"
}

# variable "sqlname" {
#   description = "The name of the MSSQL Server"
# }

# variable "sqldbname" {
#   description = "A mapping of database name and collation for the MSSQL database(s)"
# }

variable "dependencies" {
  type        = "list"
  description = "Dependency management of resources"
}

# variable "administrator_login" {
#   description = "The Administrator Login for the MSSQL Server"
# }

# variable "administrator_login_password" {
#   description = "The Password associated with the administrator_login for the MSSQL Server"
# }

# variable "retention_days" {
#   description = "Specifies the retention in days for logs for this MSSQL Server"
#   default     = 30
# }

# variable "sku_name" {
#   description = "Specifies the SKU Name for this MSSQL Server"
#   default     = "GP_Gen5_4"
# }

# variable "mssql_version" {
#   description = "The version of the MSSQL Server"
#   default     = "12.0"
# }

# variable "max_size_gb" {
#   description = "Specifies the storage size for MSSQL to use"
#   default     = 64
# }

# variable "zone_redundant" {
#   description = ""

# }

# variable "read_scale" {
#   description = ""

# }

# variable "collation" {
#   description = ""

# }

variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  default     = "canadacentral"
}

# variable "resource_group_name" {
#   description = "The name of the resource group in which to create the MSSQL Server"
# }

variable "subnet_id" {
  description = "The ID of the subnet that the MSSQL server will be connected to"
}

# variable "firewall_rules" {
#   type        = list(string)
#   description = "Specifies the Start IP Address associated with this Firewall Rule"
# }

# variable "ssl_minimal_tls_version_enforced" {
#   description = "The mimimun TLS version to support on the sever"
#   default     = "1.2"
# }

variable "active_directory_administrator_object_id" {
  description = "The Active Directory Administrator Object ID"
  default     = ""
}

variable "active_directory_administrator_tenant_id" {
  description = "The Active Directory Administrator Tenant ID"
  default     = ""
}

# variable "vulnerability_assessment_emails" {
#   type        = list(string)
#   description = "List of email addresses that should recieve the vulnerability assessment reports"
#   default     = []
# }

variable "DnsPrivatezoneId" {
  description = ""
}

variable "environment" {
  description = ""
}

variable "deploy" {
  default     = false
}

# variable "weekly_retention" {
 
# }
# variable "monthly_retention" {
 
# }
# variable "yearly_retention" {
  
# }
# variable "week_of_year" {
  
# }


# variable "policyretention_days" {
#   default     = 7
# }
  