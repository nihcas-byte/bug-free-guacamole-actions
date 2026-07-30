# -----------------------------------------------------------------------------
# Resource Group variables
# -----------------------------------------------------------------------------
variable "resource_groups" {
  description = "A map of resource groups to create."
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  default = {}
}

# -----------------------------------------------------------------------------
# Virtual Network variables
# -----------------------------------------------------------------------------
variable "virtual_networks" {
  description = "A map of virtual networks to create."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string), {})
  }))
  default = {}
}

# -----------------------------------------------------------------------------
# Subnet variables
# -----------------------------------------------------------------------------
variable "subnets" {
  description = "A map of subnets to create."
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = {}
}

# -----------------------------------------------------------------------------
# Network Security Group variables
# -----------------------------------------------------------------------------
variable "nsgs" {
  description = "A map of network security groups to create."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_id           = optional(string, null)
    tags                = optional(map(string), {})
    security_rules = optional(list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })), [])
  }))
  default = {}
}

# -----------------------------------------------------------------------------
# Key Vault variables
# -----------------------------------------------------------------------------
variable "keyvaults" {
  description = "A map of Key Vaults to create."
  type = map(object({
    name                        = string
    location                    = string
    resource_group_name         = string
    tenant_id                   = optional(string, null)
    sku_name                    = optional(string, "standard")
    purge_protection_enabled    = optional(bool, false)
    soft_delete_retention_days  = optional(number, 7)
    enabled_for_disk_encryption = optional(bool, false)
    tags                        = optional(map(string), {})
  }))
  default = {}
}
