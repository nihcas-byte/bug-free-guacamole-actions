terraform{
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "4.80.0"
        }
    }
    required_version = "1.15.8"
}

resource "azurerm_resource_group" "rg-1" {
  name     = "rg-tf-github-actions-1"
  location = "East US"
}

resource "azurerm_resource_group" "rg-2" {
  name     = "rg-tf-github-actions-2"
  location = "East US"
}