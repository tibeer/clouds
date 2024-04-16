resource "equinix_metal_vlan" "vlan" {
  description = var.name
  metro       = var.metro
  project_id  = var.project_id
  vxlan       = var.vxlan
}
