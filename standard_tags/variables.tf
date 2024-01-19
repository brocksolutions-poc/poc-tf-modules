variable "application" {
  type = string
  description = "Name of the application"
}

variable "team_name" {
  type = string
  description = "Name of the team"
}

variable "environment" {
  type = string
  description = "Environment"
}

variable "cost_center" {
  type = string
  description = "Cost center"
  default = "IT"
}