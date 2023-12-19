module "secgroup_tcp" {
  source = "../ingress_secgroup"

  vcn_id    = data.oci_core_vcns.vcns.virtual_networks[0].id
  name      = "all"
  tenant_id = var.tenant_id
  protocol  = 6
  ports     = var.ports
}

module "secgroup_udp" {
  source = "../ingress_secgroup"

  vcn_id    = data.oci_core_vcns.vcns.virtual_networks[0].id
  name      = "all"
  tenant_id = var.tenant_id
  protocol  = 17
  ports     = var.ports
}

module "instance" {
  source = "../../oracle_basic/oci_core_instance"

  name = var.name

  # maximum possible configuration 
  shape_name   = "VM.Standard.A1.Flex"
  shape_config = {
    cpus   = 4
    memory = 24
  }
  boot_bolume_size    = 200
  subnet_id           = data.oci_core_subnets.subnets.subnets[0].id
  nsg_ids             = [module.secgroup_tcp.id, module.secgroup_udp.id]
  availability_domain = data.oci_identity_availability_domains.domains.availability_domains[random_integer.random.result].name
  tenant_id           = var.tenant_id
  source_id           = var.image == null ? local.arm_image[0] : var.image
  key_pair            = var.key_pair == null ? file(pathexpand(var.key_pair_path)) : var.key_pair
}

module "instance_vnic" {
  source = "../../oracle_basic/oci_core_vnic_attachment_data"

  instance_id = module.instance.id
  tenant_id   = var.tenant_id
}

module "ipv6_address" {
  source = "../../oracle_basic/oci_core_ipv6"

  vnic_id = module.instance_vnic.vnic_attachments[0].vnic_id
}
