resource "random_string" "username" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

module "tags" {
    source = "../standard_tags"
    application = var.name
    team_name = var.team_name
    environment = var.environment
}

resource "azurerm_mssql_server" "db" {
  name                         = var.name
  resource_group_name          = var.resource_group
  location                     = var.region
  version                      = "12.0"
  administrator_login          = random_string.username.result
  administrator_login_password = random_password.password.result

  tags = module.tags.tags
}

resource "azurerm_mssql_database" "db" {
  name           = var.name
  server_id      = azurerm_mssql_server.db.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = var.max_size_gb
  read_scale     = var.read_scale
  sku_name       = var.sku
  zone_redundant = var.zone_redundant

  tags = module.tags.tags

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}