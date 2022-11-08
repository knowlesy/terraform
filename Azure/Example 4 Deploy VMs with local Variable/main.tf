# Set the Azure Provider source and version being used
locals {
location = "UK South"
}


terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.1.0"
    }
  }
}

# Configure the Microsoft Azure provider
provider "azurerm" {
  features {}
}

# Create a Resource Group if it doesn’t exist
resource "azurerm_resource_group" "LinuxVM" {
  name     = "my-linux-rg"
  location = local.location
}

# Create a Virtual Network
resource "azurerm_virtual_network" "LinuxVM" {
  name                = "my-linux-vnet"
  location            = azurerm_resource_group.LinuxVM.location
  resource_group_name = azurerm_resource_group.LinuxVM.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "my-linux-env"
  }
}

# Create a Subnet in the Virtual Network
resource "azurerm_subnet" "LinuxVM" {
  name                 = "my-linux-subnet"
  resource_group_name  = azurerm_resource_group.LinuxVM.name
  virtual_network_name = azurerm_virtual_network.LinuxVM.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create a Network Interface
resource "azurerm_network_interface" "LinuxVM" {
  name                = "my-linux-nic-${count.index}"
  location            = azurerm_resource_group.LinuxVM.location
  resource_group_name = azurerm_resource_group.LinuxVM.name
  count               = 2
  ip_configuration {
    name                          = "my-linux-nic-ip-config"
    subnet_id                     = azurerm_subnet.LinuxVM.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "my-linux-env"
  }
}

# Create a Virtual Machine
resource "azurerm_linux_virtual_machine" "LinuxVM" {
  name                            = "my-linux-vm-${count.index}"
  count                           = 2
  location                        = azurerm_resource_group.LinuxVM.location
  resource_group_name             = azurerm_resource_group.LinuxVM.name
  network_interface_ids           = [element(azurerm_network_interface.LinuxVM.*.id,count.index)]
  size                            = "Standard_B2ms"
  computer_name                   = "mylinuxVM-${count.index}"
  admin_username                  = "azureuser"
  admin_password                  = "Password1234!"
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name                 = "my-linux-os-disk-${count.index}"
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  tags = {
        "environment" = "dev"
    "locked" = "n/a"
  }
}