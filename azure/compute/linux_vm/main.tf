resource "azurerm_network_interface" "main" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "ip_configuration" {
    for_each = azurerm_public_ip.main[0]
    content {
      name                 = "public"
      public_ip_address_id = ip_configuration.id
    }
  }

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    primary                       = true
  }
}

resource "azurerm_public_ip" "main" {
  count               = var.create_public_ip ? 1 : 0
  name                = "${var.name}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.public_ip.allocation_method
  domain_name_label   = var.public_ip.domain_name_label
}

resource "azurerm_linux_virtual_machine" "main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}
