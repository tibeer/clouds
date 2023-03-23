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
  flavor_name  = "SCS-4V:8:20"
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
  image     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa7xlh7c3l2xtrn53n5ezp2thnac3hgjo6biolfxisk3l4igfl3xba"
}

module "hetzner" {
  source = "./modules/hetzner_composed/vm"
  count  = 0

  name        = "instance-${count.index}"
  server_type = "cx21" # 2C-4GB-40GB
}
