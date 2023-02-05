resource "hcloud_server" "node" {
  name        = var.name
  image       = var.image
  location    = var.location
  ssh_keys    = var.ssh_keys
  server_type = var.server_type
  public_net {
    ipv4_enabled = var.ipv4_enabled
    ipv6_enabled = var.ipv6_enabled
  }
}
