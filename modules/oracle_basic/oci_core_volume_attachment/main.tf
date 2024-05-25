resource "oci_core_volume_attachment" "volume_attachment" {
  attachment_type = var.attachment_type
  instance_id     = var.instance_id
  volume_id       = var.volume_id
}
