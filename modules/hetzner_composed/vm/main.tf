module "ssh_key" {
  source = "../../hetzner_basic/ssh_key"
  count  = var.ssh_key == null ? 1 : 0

  name = var.name
}

module "vm" {
  source = "../../hetzner_basic/server"

  name         = var.name
  image        = var.image
  ssh_keys     = [var.ssh_key == null ? module.ssh_key[0].name : var.ssh_key]
  location     = var.location
  server_type  = var.server_type
  ipv4_enabled = var.ipv4_enabled
  ipv6_enabled = var.ipv6_enabled
}
