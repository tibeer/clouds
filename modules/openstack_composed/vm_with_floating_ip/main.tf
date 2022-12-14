module "keypair" {
  count  = var.key_pair == null ? 1 : 0
  source = "../../openstack_basic/compute_keypair_v2"

  name = var.name
}

module "secgroup_ping" {
  source = "../secgroup_ping"

  name = "${var.name}-ping"
}

module "secgroup_ssh" {
  source = "../../openstack_basic/compute_secgroup_v2"

  name = "${var.name}-ssh"
}

module "vm" {
  source = "../../openstack_basic/compute_instance_v2"

  name              = var.name
  security_groups   = [module.secgroup_ping.name, module.secgroup_ssh.name]
  availability_zone = var.availability_zone
  flavor_name       = var.flavor_name
  image_name        = var.image_name
  network_name      = var.network_name
  key_pair          = var.key_pair == null ? module.keypair[0].name : var.key_pair
}

module "floatingip" {
  source = "../../openstack_basic/networking_floatingip_v2"

  pool = var.fip_pool
}

module "association" {
  source = "../../openstack_basic/compute_floatingip_associate_v2"

  instance_id = module.vm.id
  floating_ip = module.floatingip.address
}
