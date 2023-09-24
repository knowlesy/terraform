#Backup - hash out after deploying recovery vault 

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

#update RG name 
data "azurerm_resource_group" "rg" {
  name = "rg-dominant-ox"
}
#update vm name 
data "azurerm_virtual_machine" "vm" {
  name                = "ubuntuVm"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_recovery_services_vault" "vault" {
  name                = "backup-recovery-vault"
  resource_group_name = "rg-recovery_vault"
}

data "azurerm_backup_policy_vm" "policy" {
  name                = "basic-recovery-vault-policy"
  recovery_vault_name = "backup-recovery-vault"
  resource_group_name = "rg-recovery_vault"
}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = data.azurerm_recovery_services_vault.vault.resource_group_name
  recovery_vault_name = data.azurerm_recovery_services_vault.vault.name
  source_vm_id        = data.azurerm_virtual_machine.vm.id
  backup_policy_id    = data.azurerm_backup_policy_vm.policy.id
}