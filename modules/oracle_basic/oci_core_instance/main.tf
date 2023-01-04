resource "oci_core_instance" "instance" {
  availability_domain = var.availability_domain
  compartment_id      = var.tenant_id
  shape               = var.shape_name
  shape_config {
    memory_in_gbs = var.shape_config["memory"]
    ocpus         = var.shape_config["cpus"]
  }
  source_details {
    source_id               = var.source_id
    source_type             = var.source_type
    boot_volume_size_in_gbs = var.boot_bolume_size
  }
  display_name = var.name
  create_vnic_details {
    subnet_id = var.subnet_id
    nsg_ids   = var.nsg_ids
  }
  metadata = {
    ssh_authorized_keys = file(pathexpand(var.key_pair))
  }
}
