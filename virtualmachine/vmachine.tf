#network-interface creation

resource "azurerm_network_interface" "vm_nic" {
  
  name                 = "${var.vmname}-nic" 
  location             = var.location 
  resource_group_name  = var.resource_group_name 
  #tags                 =  var.tags
  ip_configuration {
    name                          =  "${var.vmname}-ipconfig" 
    subnet_id                     =  var.subnet_id 
    private_ip_address_allocation =  var.ipaddressallocnic 
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vmname
  location              = azurerm_network_interface.vm_nic.location
  resource_group_name   = azurerm_network_interface.vm_nic.resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  vm_size               = var.vm_size

  # this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
publisher = "Canonical"
offer     = "UbuntuServer" 
sku       = "16.04-LTS"
version   = "latest"
  }
  storage_os_disk {
    name              = var.storage_data_disk_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.managed_disk_type
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}
#adding extensions under

resource "azurerm_virtual_machine_extension" "monitor-agent" {
  
  name                 = "OmsAgentForLinux"
  virtual_machine_id   = azurerm_virtual_machine.main.id
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "OmsAgentForLinux"
  type_handler_version = "1.0"
  #tags                = var.tags
  timeouts {
    create = "20m"
  }
  settings = <<SETTINGS
        {
          
        }
SETTINGS
 
  protected_settings = <<PROTECTED_SETTINGS
        {
         
        }
PROTECTED_SETTINGS
}

resource "azurerm_virtual_machine_extension" "diagnostics-agent" {
  #count                = length(var.vmname) 
  name                 = "LinuxDiagnostic"
  virtual_machine_id   = azurerm_virtual_machine.main.id
  publisher            = "Microsoft.Azure.Diagnostics"
  type                 = "LinuxDiagnostic"
  type_handler_version = "3.0"
  #tags                 = var.tags
  timeouts {
    create = "20m"
  }
settings = "${replace(replace(file("${path.module}/vm_extension.json"), "__DIAGNOSTIC_STORAGE_ACCOUNT__", "${var.storage_account_name}"), "__VM_RESOURCE_ID__", "${azurerm_virtual_machine.main.id}")}"

protected_settings = <<PROTECTED_SETTINGS
   
 {
  "storageAccountName": "${var.storage_account_name}" 
 }
PROTECTED_SETTINGS
}
