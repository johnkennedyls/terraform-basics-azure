# Definición del provider que ocuparemos
provider "azurerm" {
  features {}
  subscription_id = "2f04ea2a-6146-4799-984c-d5f971c91b16"
}

resource "azurerm_resource_group" "miprimeravmrg" {
  name     = "miprimeravmrg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "miprimeravmvnet" {
  name                = "miprimeravmvnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.miprimeravmrg.location
  resource_group_name = azurerm_resource_group.miprimeravmrg.name
}

resource "azurerm_subnet" "miprimeravmsubnet" {
  name                 = "miprimeravmsubnet"
  resource_group_name  = azurerm_resource_group.miprimeravmrg.name
  virtual_network_name = azurerm_virtual_network.miprimeravmvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "miprimeravmnic" {
  name                = "miprimeravmnic"
  location            = azurerm_resource_group.miprimeravmrg.location
  resource_group_name = azurerm_resource_group.miprimeravmrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.miprimeravmsubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "miprimeravm" {
  name                = "miprimeravm"
  resource_group_name = azurerm_resource_group.miprimeravmrg.name
  location            = azurerm_resource_group.miprimeravmrg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Password*#123"
  network_interface_ids = [
    azurerm_network_interface.miprimeravmnic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  disable_password_authentication = false
  provision_vm_agent              = true
}