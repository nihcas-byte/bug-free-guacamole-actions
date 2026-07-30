variable "name" {
  description = "The name of the network security group."
  type        = string
}

variable "location" {
  description = "The Azure region where the NSG will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the NSG."
  type        = string
}

variable "security_rules" {
  description = "A list of security rule objects to apply to the NSG."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with this NSG. Set to null to skip association."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the NSG."
  type        = map(string)
  default     = {}
}
