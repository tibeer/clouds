resource "equinix_metal_device" "instance" {
  hostname            = var.name
  plan                = var.flavor_name
  metro               = var.metro
  operating_system    = var.image_name
  billing_cycle       = var.billing_cycle
  project_id          = var.project_id
  project_ssh_key_ids = var.project_ssh_key_ids

  ip_address {
    type = "private_ipv4"
    cidr = 30
  }

  ip_address {
    type = "public_ipv6"
  }
}
