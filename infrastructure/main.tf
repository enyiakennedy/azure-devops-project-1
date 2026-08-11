resource "azurerm_resource_group" "project" {
  name     = "rg-azure-devops-project1"
  location = var.location
}

resource "azurerm_storage_account" "project" {
  name                     = "stazuredevopsproject1"
  resource_group_name      = azurerm_resource_group.project.name
  location                 = azurerm_resource_group.project.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account_static_website" "project" {
  storage_account_id = azurerm_storage_account.project.id
  index_document     = "index.html"
  error_404_document = "404.html"
}

data "azurerm_storage_container" "web" {
  name               = "$web"
  storage_account_id = azurerm_storage_account.project.id
}

resource "azurerm_storage_blob" "website" {
  name                 = "index.html"
  storage_container_id = data.azurerm_storage_container.web.id
  type                 = "Block"
  source               = "../index.html"
  content_type         = "text/html"
}