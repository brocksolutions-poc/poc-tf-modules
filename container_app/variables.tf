variable region {
    type = string
    description = "Region of deployent"
}

variable app_name {
    type = string
    description = "Name of the app"
}

variable resource_group {
    type = string
    description = "Name of the resource group"
}

variable container_name {
    type = string
    description = "Name of the container"
}

variable image_tag {
    type = string
    description = "Image tag"
}

variable cpu {
    type = number
    description = "CPU"
    default = 0.25
}

variable memory {
    type = string
    description = "Memory"
    default = "0.5Gi"
}

variable "max_replicas" {
  type = number
  description = "Maximum number of replicas"
  default = 3
  
}

variable "min_replicas" {
  type = number
  description = "Minimum number of replicas"
  default = 1
}

variable "team_name" {
  type = string
  description = "Name of the team"
}

variable "environment" {
  type = string
  description = "Deployment Environment"
}

variable "image_registry_token" {
  type = string
  description = "Image registry token associated with user for registry access"
}
