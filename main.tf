terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.23.0"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Create a server
resource "hcloud_server" "terraform101" {
  name = "terraform101.tabaradeweb.ro"
  image = "ubuntu-20.04"
  server_type = "cx11"
}
