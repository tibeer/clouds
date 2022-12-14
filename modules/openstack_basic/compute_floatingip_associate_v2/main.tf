resource "openstack_compute_floatingip_associate_v2" "fip" {
  floating_ip = var.floating_ip
  instance_id = var.instance_id
}
