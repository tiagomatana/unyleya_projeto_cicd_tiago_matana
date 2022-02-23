terraform {
  required_providers {
    azurerm = {
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "name" {
  name     = "devops-RG"
  location = "West US"

}

resource "azurerm_virtual_network" "name" {
  name                = "devops-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.name.location
  resource_group_name = azurerm_resource_group.name.name
}

resource "azurerm_subnet" "name" {
  name                 = "devops-subnet"
  resource_group_name  = azurerm_resource_group.name.name
  virtual_network_name = azurerm_virtual_network.name.name
  address_prefixes       = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "name" {
  name                = "devops-nic"
  location            = azurerm_resource_group.name.location
  resource_group_name = azurerm_resource_group.name.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.name.id
    private_ip_address_allocation = "Dynamic"
  }

}

