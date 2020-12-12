terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.23.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {}
variable "ssh_key" {}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Create a new SSH key
resource "hcloud_ssh_key" "default" {
  name = "Terraform Example"
  public_key = var.ssh_key
}

# Create a server
resource "hcloud_server" "terraform101" {
  name = "terraform101.tabaradeweb.ro"
  image = "ubuntu-20.04"
  server_type = "cx11"
  location = "hel1"
  datacenter = "hel1-dc2"
  ssh_keys = [ hcloud_ssh_key.default.name ]
  keep_disk = true
}
