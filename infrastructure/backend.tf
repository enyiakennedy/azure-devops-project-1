terraform {
  backend "azurerm" {
    resource_group_name  = "rg-azure-devops-project1"
    storage_account_name = "sttfstateazuredevops1"
    container_name       = "tfstate"
    key                  = "project1.tfstate"
  }
}