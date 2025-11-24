variable "location" {
  type        = string
  description = "The Azure region to deploy to"
  default     = "eastus"
}

variable "environment" {
  type        = string
  description = "The environment name (dev, staging, prod)"
}

variable "project_name" {
  type        = string
  description = "The name of the project"
  default     = "devopsproject"
}