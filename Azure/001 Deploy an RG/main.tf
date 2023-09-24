terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}

#required
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "TestRG-Terram"
  location = "uksouth"
  tags = {
    "environment" = "dev"
    "locked" = "delete"
  }
}