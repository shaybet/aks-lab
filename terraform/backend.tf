terraform {
  backend "azurerm" {
    resource_group_name   = "commit-lab-stg-rg"
    storage_account_name  = "commitlabterraformstate"
    container_name        = "terraform-state"
    key                    = "terraform.tfstate"
  }
}