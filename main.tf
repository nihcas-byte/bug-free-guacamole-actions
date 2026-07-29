terraform{
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

resource "azurerm_resource_group" "rg-1" {
  name     = "rg-tf-github-actions-23"
  location = "East US"
}

