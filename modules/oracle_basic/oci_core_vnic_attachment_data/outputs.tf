output "vnic_attachments" {
  value = data.oci_core_vnic_attachments.vnic_attachment.vnic_attachments
}
