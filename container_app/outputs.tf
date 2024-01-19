output log_analytics_workspace_name {
    value = azurerm_log_analytics_workspace.app.name
}

output log_analytics_workspace_id {
    value = azurerm_log_analytics_workspace.app.id
}

output container_app_environment_name {
    value = azurerm_container_app_environment.app.name
}

output container_app_environment_id {
    value = azurerm_container_app_environment.app.id
}

output container_app_id {
    value = azurerm_container_app.app.id
}