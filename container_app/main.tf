module "tags" {
  source = "../standard_tags"
  application = var.app_name
  team_name = var.team_name
  environment = var.environment
}

# This could also be a mandatory parameter
resource "azurerm_log_analytics_workspace" "app" {
  name                = var.app_name
  location            = var.region
  resource_group_name = var.resource_group
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = module.tags.tags
}

resource "azurerm_container_app_environment" "app" {
  name                       = var.app_name
  location                   = var.region
  resource_group_name        = var.resource_group
  log_analytics_workspace_id = azurerm_log_analytics_workspace.app.id

  tags = module.tags.tags
}

resource "azurerm_container_app" "app" {
  name                         = var.app_name
  container_app_environment_id = azurerm_container_app_environment.app.id
  resource_group_name          = var.resource_group
  revision_mode                = "Single"
  registry {
    server               = "ghcr.io"
    username             = "amasare"
    password_secret_name = "registry-token"
  }
  secret {
    name  = "registry-token"
    value = var.image_registry_token
  }
  tags = module.tags.tags

  ingress {
    allow_insecure_connections = true
    external_enabled           = true
    target_port                = 5002
    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = var.container_name
      image  = var.image_tag
      cpu    = var.cpu
      memory = var.memory
    }
    max_replicas = var.max_replicas
    min_replicas = var.min_replicas
    # NOTE: This doesn't have an init_container block or
    # other configurations which could be a problem for some users
  }
}
