vnet_name              = "test-vnet"
vnet_address_prefix    = ["10.3.0.0/16"]

subnet_name            = "test-subnet"
subnet_address_space   = "10.3.0.0/24"

vmname                 = "testvmachine"
location               = "East US" 
resource_group_name    = "testrg"
vm_size                = "Standard_DS1_v2"
ipaddressallocnic      = "dynamic"

publisher = "Canonical"
offer     = "UbuntuServer" 
sku       = "16.04-LTS"
version   = "latest"

storage_data_disk_name       = "myosdisk-test"
managed_disk_type = "Standard_LRS"

storage_account_name  = "trailstorageaccount"

