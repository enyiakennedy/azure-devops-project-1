resource "azurerm_resource_group" "project" {
  name     = "rg-azure-devops-project1"
  location = var.location
}