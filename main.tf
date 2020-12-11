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
