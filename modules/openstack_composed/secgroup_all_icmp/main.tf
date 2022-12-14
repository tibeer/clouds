module "secgroup" {
  source = "../../openstack_basic/compute_secgroup_v2"

  name        = var.name
  from_port   = 0
  to_port     = 0
  ip_protocol = "icmp"
  cidr        = var.cidr
}