#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_blob_container_sas
#https://support.hashicorp.com/hc/en-us/articles/5175257151891-How-to-output-sensitive-data-with-Terraform

resource "azurerm_resource_group" "rg" {
  name     = "resourceGroupName"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "mycontainer"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

data "azurerm_storage_account_blob_container_sas" "example" {
  connection_string = azurerm_storage_account.storage.primary_connection_string
  container_name    = azurerm_storage_container.container.name
  https_only        = true

  ip_address = "168.1.5.65"

  start  = "2018-03-21"
  expiry = "2018-03-21"

  permissions {
    read   = true
    add    = true
    create = false
    write  = false
    delete = true
    list   = true
  }

  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"
}

#Options here
output "secure_sas_url_query_string" {
  value = data.azurerm_storage_account_blob_container_sas.example.sas
  sensitive = true
}

output "not_secure_sas_url_query_string" {
  value = nonsensitive(data.azurerm_storage_account_blob_container_sas.example.sas)
}
