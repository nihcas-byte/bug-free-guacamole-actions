# -----------------------------------------------------------------------------
# Resource Group outputs
# -----------------------------------------------------------------------------
output "resource_group_ids" {
  description = "A map of resource group names to their IDs."
  value       = { for k, v in module.resource_groups : k => v.id }
}

output "resource_group_names" {
  description = "A map of resource group keys to their names."
  value       = { for k, v in module.resource_groups : k => v.name }
}

# -----------------------------------------------------------------------------
# Virtual Network outputs
# -----------------------------------------------------------------------------
output "virtual_network_ids" {
  description = "A map of virtual network keys to their IDs."
  value       = { for k, v in module.virtual_networks : k => v.id }
}

output "virtual_network_names" {
  description = "A map of virtual network keys to their names."
  value       = { for k, v in module.virtual_networks : k => v.name }
}

# -----------------------------------------------------------------------------
# Subnet outputs
# -----------------------------------------------------------------------------
output "subnet_ids" {
  description = "A map of subnet keys to their IDs."
  value       = { for k, v in module.subnets : k => v.id }
}

output "subnet_names" {
  description = "A map of subnet keys to their names."
  value       = { for k, v in module.subnets : k => v.name }
}

# -----------------------------------------------------------------------------
# NSG outputs
# -----------------------------------------------------------------------------
output "nsg_ids" {
  description = "A map of NSG keys to their IDs."
  value       = { for k, v in module.nsgs : k => v.id }
}

output "nsg_names" {
  description = "A map of NSG keys to their names."
  value       = { for k, v in module.nsgs : k => v.name }
}

# -----------------------------------------------------------------------------
# Key Vault outputs
# -----------------------------------------------------------------------------
output "keyvault_ids" {
  description = "A map of Key Vault keys to their IDs."
  value       = { for k, v in module.keyvaults : k => v.id }
}

output "keyvault_names" {
  description = "A map of Key Vault keys to their names."
  value       = { for k, v in module.keyvaults : k => v.name }
}

output "keyvault_uris" {
  description = "A map of Key Vault keys to their vault URIs."
  value       = { for k, v in module.keyvaults : k => v.vault_uri }
}
