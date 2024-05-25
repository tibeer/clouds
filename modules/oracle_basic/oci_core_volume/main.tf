resource "oci_core_volume" "volume" {
  compartment_id      = var.tenant_id
  availability_domain = var.availability_domain
  display_name        = var.name
  size_in_gbs         = var.size
}
