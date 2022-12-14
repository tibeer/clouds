output "id" {
  value = openstack_compute_instance_v2.instance.id
}

output "name" {
  value = openstack_compute_instance_v2.instance.name
}

output "access_ip_v4" {
  value = openstack_compute_instance_v2.instance.access_ip_v4
}
