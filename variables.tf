variable "vultr_api_key" {
  type        = string
  description = "API to work with Vultr Provider"
  sensitive   = true # Hide sensitive info
}

variable "vultr_region" {
    type        = string
    description = "Region, default to paris"
    default     = "cdg"
}