resource "openstack_compute_instance_v2" "instance" {
  name              = var.name
  image_name        = var.image_name
  flavor_name       = var.flavor_name
  key_pair          = var.key_pair
  security_groups   = var.security_groups
  availability_zone = var.availability_zone

  network {
    name = var.network_name
  }
}
