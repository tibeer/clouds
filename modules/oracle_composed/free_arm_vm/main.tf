module "vcn" {
  source                  = "oracle-terraform-modules/vcn/oci"
  version                 = "3.6.0"
  compartment_id          = var.tenant_id
  vcn_name                = var.name
  vcn_cidrs               = ["10.0.0.0/16"]
  create_internet_gateway = true
  create_nat_gateway      = true
  create_service_gateway  = true
  enable_ipv6             = true
}

# Note: The VCN module currently does not support IPv6 in a fashion that is useable for my context.
# Therefore I pulled all information again from the VCN and create a security list as well as a
# subnet manually. Watch out: A subnet without a route_table_id will not use the default from the
# VCN as described in the module itself. Better force it to use the one from the VCN itself.
data "oci_core_vcn" "vcn" {
  vcn_id = module.vcn.vcn_id
}
resource "oci_core_security_list" "security_list" {
  compartment_id = var.tenant_id
  vcn_id         = data.oci_core_vcn.vcn.id
  display_name   = var.name

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
  egress_security_rules {
    destination = "::/0"
    protocol    = "all"
  }
  ingress_security_rules {
    source   = "0.0.0.0/0"
    protocol = "all"
  }
  ingress_security_rules {
    source   = "::/0"
    protocol = "all"
  }
}
resource "oci_core_subnet" "subnet" {
  cidr_block        = "10.0.0.0/24"
  compartment_id    = var.tenant_id
  vcn_id            = data.oci_core_vcn.vcn.vcn_id
  display_name      = var.name
  ipv6cidr_block    = cidrsubnet(data.oci_core_vcn.vcn.ipv6cidr_blocks[0], 8, 16)
  security_list_ids = [oci_core_security_list.security_list.id]
  route_table_id    = module.vcn.ig_route_id
}
# END of hacky IPv6 support

module "secgroup" {
  source = "../ingress_secgroup"

  vcn_id    = module.vcn.vcn_id
  name      = "all"
  tenant_id = var.tenant_id
  protocol  = "all"
  ports     = var.ports
}

module "instance" {
  source = "../../oracle_basic/oci_core_instance"

  name = var.name

  # maximum possible configuration 
  shape_name = "VM.Standard.A1.Flex"
  shape_config = {
    cpus   = 4
    memory = 24
  }
  boot_bolume_size    = 200
  subnet_id           = oci_core_subnet.subnet.id
  nsg_ids             = [module.secgroup.id]
  availability_domain = data.oci_identity_availability_domains.domains.availability_domains[random_integer.random.result].name
  tenant_id           = var.tenant_id
  source_id           = local.arm_image[0] # first is always the newest
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
