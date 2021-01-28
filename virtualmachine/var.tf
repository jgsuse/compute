variable "resource_group_name" {
  description = "Specifies the name of the Resource Group in which the Virtual Machine should exist"
  type = string
}
variable "location" {
  description = "Specifies the Azure Region where the Virtual Machine exists"
  type = string
}
variable "subnet_id" {
  description = " The ID of the Subnet to create the Network interface"
  type = string
}
variable "ipaddressallocnic" {
  description = "ip address alllocation for Nic. The possible options are Status and Dynamic"
  type = string
}
variable "vmname" {
  description = "Name of Virtual Machines to be provisioned."
  type = string
}
variable "vm_size" {
  description = "Specify VM size like standard, general purpose ,storage optimised etc"
  type = string
}

/*variable "Username" {
  description = "specify UserName for virtual machine"
  type = string
}
variable "Password" {
  description = "specify Password for virtual machine"
  type = string
}*/
 variable "storage_data_disk_name" {
  description = "name and size of the data disk for virtual machine"
  type = string
}
variable "managed_disk_type" {
  description = "The storage account type for the managed data disk"
  type = string
}
/*variable "workspace_key" {
  description = "The primary key of the Log analytics workspace"
  type = string
}*/
variable "storage_account_name" {
  description = "Storage account name "
  type = string
} 