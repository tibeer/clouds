output "id" {
  value = openstack_compute_floatingip_associate_v2.fip.id
}

output "floating_ip" {
  value = openstack_compute_floatingip_associate_v2.fip.floating_ip
}
