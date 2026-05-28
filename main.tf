terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Provider and API KEY
provider "digitalocean" {
  token = var.do_token
}

# Deploy a new Droplet on DO
resource "digitalocean_droplet" "cluster" {
  image  = "ubuntu-24-04-x64"
  name   = "k8s lab"
  region = "sgp1"              # sgp1 aka Singapore
  size   = "s-2vcpu-8gb"
  backups = true
  backup_policy {
    plan    = "weekly"
    weekday = "MON"
    hour    = 8
  }
}

# Display Droplet's IP after deploy
output "do_droplet_ip" {
    value = digitalocean_droplet.cluster.ipv4_address
}