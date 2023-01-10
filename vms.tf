module "betacloud" {
  source = "./modules/openstack_composed/vm_without_firewall"
  count  = 0

  providers = {
    openstack = openstack.betacloud
  }

  name         = "instance-${count.index}"
  flavor_name  = "2C-2GB-10GB"
  image_name   = "Ubuntu 20.04"
  fip_pool     = "external"
  network_name = "net-to-external-beermann"
}

module "pluscloudopen" {
  source = "./modules/openstack_composed/vm_without_firewall"
  count  = 1

  providers = {
    openstack = openstack.scs
  }

  name         = "instance-${count.index}"
  flavor_name  = "SCS-2V:2:20"
  image_name   = "Ubuntu 22.04"
  fip_pool     = "ext01"
  network_name = "p500924-beermann-network"
}

module "oracle" {
  source = "./modules/oracle_composed/free_arm_vm"
  count  = 1 # do not change, otherwise it will cost money!

  name      = "free-${count.index}"
  tenant_id = local.oci_tenant_ids[0]
  ports     = [22, 80]
}
