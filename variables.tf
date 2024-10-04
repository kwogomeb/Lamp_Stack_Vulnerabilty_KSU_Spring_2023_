variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Region where the resources will be created"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone where the VM instance will be deployed"
  type        = string
  default     = "us-central1-a"
}
