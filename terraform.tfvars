# =============================================================================
# Sample values — update these to match your environment
# =============================================================================

# --- Resource Groups ---------------------------------------------------------
resource_groups = {
  rg1 = {
    name     = "rg-network-eastus"
    location = "East US"
    tags = {
      environment = "dev"
      project     = "infra"
    }
  }
  rg2 = {
    name     = "rg-security-eastus"
    location = "East US"
    tags = {
      environment = "dev"
      project     = "infra"
    }
  }
}

# --- Virtual Networks --------------------------------------------------------
virtual_networks = {
  vnet1 = {
    name                = "vnet-main-eastus"
    location            = "East US"
    resource_group_name = "rg-network-eastus"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
  }
}

# --- Subnets -----------------------------------------------------------------
subnets = {
  subnet1 = {
    name                 = "snet-web"
    resource_group_name  = "rg-network-eastus"
    virtual_network_name = "vnet-main-eastus"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "snet-app"
    resource_group_name  = "rg-network-eastus"
    virtual_network_name = "vnet-main-eastus"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

# --- Network Security Groups ------------------------------------------------
nsgs = {
  nsg1 = {
    name                = "nsg-web"
    location            = "East US"
    resource_group_name = "rg-security-eastus"
    tags = {
      environment = "dev"
    }
    security_rules = [
      {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-HTTPS"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

# --- Key Vaults --------------------------------------------------------------
keyvaults = {
  kv1 = {
    name                        = "kv-6792-dev-2343"
    location                    = "East US"
    resource_group_name         = "rg-security-eastus"
    sku_name                    = "standard"
    purge_protection_enabled    = false
    soft_delete_retention_days  = 7
    enabled_for_disk_encryption = true
    tags = {
      environment = "dev"
    }
  }
}
