locals {
  tags = {
    Application = var.application
    Team   = var.team_name
    Environment = var.environment
    Cost_Center = var.cost_center
  }
}