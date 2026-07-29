terraform{
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "4.80.0"
        }
    }
    required_version = "1.15.8"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-github-actions"
  location = "East US"
}