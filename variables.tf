# Server

variable "server" {
  description = "The name of the MSSQL Server"
  type = any
}



variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  default     = "canadacentral"
}

variable "subnet_id" {
  description = "The ID of the subnet that the MSSQL server will be connected to"
}

# variable "subnet_id_EP" {
#   description = "The ID of the subnet that the Apps Service server will be connected to"
# }

variable "active_directory_administrator_object_id" {
  description = "The Active Directory Administrator Object ID"
  default     = ""
}

variable "active_directory_administrator_tenant_id" {
  description = "The Active Directory Administrator Tenant ID"
  default     = ""
}

variable "DnsPrivatezoneId" {
  description = ""
}

variable "environment" {
  description = ""
}

variable "deploy" {
  default     = false
}

variable "allow_nested_items_to_be_public" {
  default     = true
}

variable "min_tls_version" {
  default     = "TLS1_2"
}