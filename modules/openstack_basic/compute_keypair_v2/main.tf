resource "openstack_compute_keypair_v2" "keypair" {
  name       = var.name
  public_key = file(pathexpand(var.path))
}
