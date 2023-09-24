
terraform {
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"

    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}
provider "azurerm" {
  features {
  }
}
resource "azurerm_resource_group" "backup" {
  name     = "rg-recovery_vault"
  location = "UK South"
}

resource "azurerm_recovery_services_vault" "backup" {
  name                         = "backup-recovery-vault"
  location                     = azurerm_resource_group.backup.location
  resource_group_name          = azurerm_resource_group.backup.name
  sku                          = "Standard"
  storage_mode_type            = "LocallyRedundant"
  soft_delete_enabled          = false
  cross_region_restore_enabled = false
}

resource "azurerm_backup_policy_vm" "backup" {
  name                = "basic-recovery-vault-policy"
  resource_group_name = azurerm_resource_group.backup.name
  recovery_vault_name = azurerm_recovery_services_vault.backup.name
  instant_restore_retention_days  = 1
  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }

  retention_weekly {
    count    = 4
    weekdays = ["Friday"]
  }

}