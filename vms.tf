module "betacloud" {
  source = "./modules/openstack_composed/vm_without_firewall"
  count  = 0

  providers = {
    openstack = openstack.betacloud
  }

  name         = "instance-${count.index}"
  flavor_name  = "SCS-4V:8:100"
  image_name   = "Ubuntu 20.04"
  fip_pool     = "external"
  network_name = "net-to-external-beermann"
}

module "oracle" {
  source = "./modules/oracle_composed/free_arm_vm"
  count  = 1 # do not change, otherwise it will cost money!

  name      = "free-${count.index}"
  tenant_id = local.oci_tenant_ids[0]
  ports     = [22, 80]
}
