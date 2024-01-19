variable "name" {
  type = string
  description = "Name of the SQL DB"
}

variable "resource_group" {
  type = string
  description = "Name of the resource group"
}

variable "region" {
  type = string
  description = "Location of the SQL DB"
}

variable "max_size_gb" {
  type = number
  description = "Maximum size of the SQL DB in GB"
  default = 30
}

variable "sku" {
  type = string
  description = "SKU of the SQL DB"
  default = "S0"
}

variable "read_scale" {
  type = bool
  description = "Enable a readonly secondary replica"
  default = false
}

variable "zone_redundant" {
  type = bool
  description = "Enable zone redundancy"
  default = false
}

variable "team_name" {
  type = string
  description = "Name of the team"
}

variable "environment" {
  type = string
  description = "Deployment Environment"
}