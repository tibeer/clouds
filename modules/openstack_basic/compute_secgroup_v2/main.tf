resource "openstack_compute_secgroup_v2" "secgroup" {
  name        = var.name
  description = var.name

  rule {
    cidr        = var.cidr
    ip_protocol = var.ip_protocol
    from_port   = var.from_port
    to_port     = var.to_port
  }
}
