module "secgroups" {
  source = "../ingress_secgroups"

  vcn_id    = data.oci_core_vcns.vcns.virtual_networks[0].id
  name      = "all"
  tenant_id = var.tenant_id
  protocol  = 6
  ports     = var.ports
}

module "instance" {
  source = "../../oracle_basic/oci_core_instance"

  name = var.name

  # maximum possible configuration 
  shape_name   = "VM.Standard.A1.Flex"
  shape_config = {
    memory = 24
    cpus   = 4
  }
  boot_bolume_size    = 200
  subnet_id           = data.oci_core_subnets.subnets.subnets[0].id
  nsg_ids             = module.secgroups.nsg_ids
  availability_domain = data.oci_identity_availability_domains.domains.availability_domains[random_integer.random.result].name
  tenant_id           = var.tenant_id
  source_id           = var.image == null ? local.arm_image[0] : var.image
}

# This does not work currently!
#module "ipv6_vnic" {
#  source = "../../oracle_basic/oci_core_vnic_attachment"
#
#  instance_id = module.instance.id
#  subnet_id   = data.oci_core_subnets.subnets.subnets[0].id
#  nsg_ids     = module.secgroups.nsg_ids
#}
#
#module "ipv6_address" {
#  source = "../../oracle_basic/oci_core_ipv6"
#
#  vnic_id = module.ipv6_vnic.vnic_id
#}
