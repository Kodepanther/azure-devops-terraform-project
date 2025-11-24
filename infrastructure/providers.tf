terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  # We configure the backend "type" here, but we will pass the 
  # specific keys/names in the Azure DevOps Pipeline later.
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}