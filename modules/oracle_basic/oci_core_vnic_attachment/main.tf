resource "oci_core_vnic_attachment" "vnic_attachment" {
  create_vnic_details {
    subnet_id        = var.subnet_id
    nsg_ids          = var.nsg_ids
  }
  instance_id = var.instance_id
}
