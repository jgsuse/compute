variable "resource_group_name" {
   description = "The name of the  resource group in which to create the virtual network"
   type = string
}
variable "location" {
 description = "The location/region where the Resource Group is created"
 type = string
}
/*variable "tags" {
  description = "A mapping of tags for all resources"
  type = map
}*/
variable "vnet_name" {
  description = "The name of the virtual network"
  type = string
}
variable "vnet_address_prefix" {
  description = "The address prefix to use for the vnet"
  type = list
}
variable "subnet_name" {
   description = "The name of the subnet"
   type = string
}
variable "subnet_address_space" {
    description = "The address space that is used for the subnet"
    type = string
}