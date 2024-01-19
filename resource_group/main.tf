module "tags" {
    source = "../standard_tags"
    application = var.name
    team_name = var.team_name
    environment = var.environment
}

resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.region
  tags = module.tags.tags
}