variable "do_token" {
  type        = string
  description = "API to work with Provider"
  sensitive   = true # Hide sensitive info
}

variable "vultr_region" {
    type        = string
    description = "Region, default to paris"
    default     = "cdg"
}