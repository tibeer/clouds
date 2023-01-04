module "secgroup" {
  source = "../../oracle_basic/oci_core_network_security_group"

  tenant_id = var.tenant_id
  vcn_id    = var.vcn_id
  name      = var.name
}

module "scgroup_rule_ipv4_ingress" {
  source = "../../oracle_basic/oci_core_network_security_group_security_rule"

  nsg_id = module.secgroup.id
  direction = "INGRESS"
  protocol  = var.protocol
  from_port = var.port == null ? var.from_port : var.port
  to_port   = var.port == null ? var.to_port : var.port
  is_ipv6_rule = false
}

module "secgroup_rule_ipv4_egress" {
  source = "../../oracle_basic/oci_core_network_security_group_security_rule"

  nsg_id = module.secgroup.id
  direction = "EGRESS"
  protocol = "all"
  is_ipv6_rule = false
}

module "secgroup_rule_ipv6_ingress" {
  source = "../../oracle_basic/oci_core_network_security_group_security_rule"

  nsg_id = module.secgroup.id
  direction = "INGRESS"
  protocol  = var.protocol
  from_port = var.port == null ? var.from_port : var.port
  to_port   = var.port == null ? var.to_port : var.port
  is_ipv6_rule = true
}

module "secgroup_rule_ipv6_egress" {
  source = "../../oracle_basic/oci_core_network_security_group_security_rule"

  nsg_id = module.secgroup.id
  direction = "EGRESS"
  protocol = "all"
  is_ipv6_rule = true
}
