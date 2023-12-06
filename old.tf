#module "regiocloud" {
#  count  = 0
#  source = "./modules/openstack_composed/vm_without_firewall"
#
#  providers = {
#    openstack = openstack.regiocloud
#  }
#
#  name         = "instance-${count.index}"
#  flavor_name  = "SCS-4V-8-50"
#  image_name   = "Ubuntu 22.04"
#  fip_pool     = "public"
#  network_name = "vanilla"
#}
#
#module "pluscloudopen" {
#  count  = 0
#  source = "./modules/openstack_composed/vm_without_firewall"
#
#  providers = {
#    openstack = openstack.scs
#  }
#
#  name         = "instance-${count.index}"
#  flavor_name  = "SCS-16V:64:100"
#  image_name   = "Ubuntu 22.04"
#  fip_pool     = "ext01"
#  network_name = "p500924-beermann-network"
#}

