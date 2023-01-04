resource "oci_core_network_security_group" "secgroup" {
  compartment_id = var.tenant_id
  vcn_id         = var.vcn_id
  display_name   = var.name
}
