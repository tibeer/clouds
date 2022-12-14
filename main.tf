module "betacloud" {
  source = "./modules/openstack_composed/vm_without_firewall"
  count  = 0

  providers = {
    openstack = openstack.betacloud
  }

  name         = "mirror-${count.index}"
  flavor_name  = "2C-2GB-20GB"
  image_name   = "Debian 10"
  fip_pool     = "external"
  network_name = "net-to-external-beermann"
}

