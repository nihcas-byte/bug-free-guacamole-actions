terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "logic-app-rg"
    storage_account_name = "sttfgithubactions01"
    container_name       = "tfstate"
    key                  = "dev-gh.terraform.tfstate"
  }
  required_version = "1.15.8"
}

locals {
  
}



# =============================================================================
# Module calls — each uses for_each with map variables
# =============================================================================

# --- Resource Groups ---------------------------------------------------------
module "resource_groups" {
  source   = "./modules/resource_group"
  for_each = var.resource_groups

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}

# --- Virtual Networks --------------------------------------------------------
module "virtual_networks" {
  source   = "./modules/virtual_network"
  for_each = var.virtual_networks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  tags                = each.value.tags

  depends_on = [module.resource_groups]
}

# --- Subnets -----------------------------------------------------------------
module "subnets" {
  source   = "./modules/subnet"
  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes

  depends_on = [module.virtual_networks]
}

# --- Network Security Groups ------------------------------------------------
module "nsgs" {
  source   = "./modules/nsg"
  for_each = var.nsgs

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  security_rules      = each.value.security_rules
  subnet_id           = each.value.subnet_id
  tags                = each.value.tags

  depends_on = [module.resource_groups]
}

# --- Key Vaults --------------------------------------------------------------
module "keyvaults" {
  source   = "./modules/keyvault"
  for_each = var.keyvaults

  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  tenant_id                   = each.value.tenant_id
  sku_name                    = each.value.sku_name
  purge_protection_enabled    = each.value.purge_protection_enabled
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tags                        = each.value.tags

  depends_on = [module.resource_groups]
}
