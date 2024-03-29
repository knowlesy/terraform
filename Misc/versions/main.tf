terraform {
  required_version = "~>1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.42.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}