terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud {

    organization = "ainahmuorg"

    workspaces {
      name = "Hands-on-lab-terraform-azure"
    }
  }
}
# Provider block
provider "azurerm" {
  features {}
  subscription_id            = "80ea84e8-afce-4851-928a-9e2219724c69"
  skip_provider_registration = true
}
resource "azurerm_resource_group" "rg" {
  name     = "813-31fbdd3b-hands-on-with-terraform-on-azure"
  location = "South Central US"
}

module "securestorage" {
  source      = "app.terraform.io/ainahmuorg/securestorage/azurerm"
  version     = "1.0.0"
  environment = "Production"
  # insert required variables here
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "storageaccount3564788"
}

