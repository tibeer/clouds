data "oci_core_vnic_attachments" "vnic_attachment" {
  compartment_id = var.tenant_id
  instance_id    = var.instance_id
}
