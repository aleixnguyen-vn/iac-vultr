terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.19.0"
    }
  }
}

# Goi Provider va truyen cai bien API Key vao
provider "vultr" {
  api_key = var.vultr_api_key
}

variable "vps_instances" {
  type = map(any)
  default = {
    web = { plan = "vc2-1c-1gb", label = "prod-web" }
    api = { plan = "vc2-1c-1gb", label = "prod-api" }
  }
}

# Khai bao tao con VPS Ubuntu 22.04 l0 nhat de test
resource "vultr_instance" "clusters" {
    for_each = var.vps_instances
  plan          = each.value.plan # Goi l0 1 CPU - 1GB RAM ($5/thang)
  region      = var.vultr_region           # Paris cho ping ve Ha Tinh cuc em
  os_id       = 2284             # ID cua Ubuntu 22.04 LTS tren Vultr
  label       = each.value.label
  tags         = ["tag1", "tag2"]
  backups     = "enabled"
  backups_schedule {
    type = "daily"
  }
  hostname = "aleix.host"
}

output "cluster_ips" {
    value = { for k, v in vultr_instance.clusters : k => v.main_ip }
}