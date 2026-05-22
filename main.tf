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
resource "digitalocean_droplet" "web_server" {
  image  = "ubuntu-22-04-x64"
  name   = "project-1d-wpfpm"
  region = "sgp1"              # sgp1 aka Singapore
  size   = "s-1vcpu-1gb"       # smallest droplet
  backups = true
  backup_policy {
    plan    = "weekly"
    weekday = "MON"
    hour    = 8
  }
}

# Display Droplet's IP after deploy
output "do_droplet_ip" {
    value = digitalocean_droplet.web_server.ipv4_address
}