provider "azurerm" {
  features {}
}

module "Network"{
 source   ="./virtualnetwork"
 vnet_name                 = var.vnet_name
 location                  = var.location 
 resource_group_name       = var.resource_group_name
 vnet_address_prefix       = var.vnet_address_prefix
 #dns_servers              = var.dns_servers
 #tags                     = var.tags

 subnet_name               = var.subnet_name
 subnet_address_space      = var.subnet_address_space
}
module "compute"{
 source   ="./virtualmachine"
 vmname                    = var.vmname
 location                  = var.location 
 resource_group_name       = var.resource_group_name
 subnet_id                 = "${module.Network.subnet_ids}"
 ipaddressallocnic         = var.ipaddressallocnic
 #tags                     = var.tags
vm_size                    = var.vm_size

 storage_data_disk_name    = var.storage_data_disk_name
 managed_disk_type         = var.managed_disk_type

 #workspace_key             = var.workspace_key
 #workspace_id             = "${module.compute.workspace_ids}"

 storage_account_name  = var.storage_account_name
 #sas_token = var.sas_token
}