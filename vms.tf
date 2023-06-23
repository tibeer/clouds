module "regiocloud" {
  count  = 0
  source = "./modules/openstack_composed/vm_without_firewall"

  providers = {
    openstack = openstack.regiocloud
  }

  name         = "instance-${count.index}"
  flavor_name  = "SCS-4V-8-50"
  image_name   = "Ubuntu 22.04"
  fip_pool     = "public"
  network_name = "vanilla"
}

module "pluscloudopen" {
  count  = 0
  source = "./modules/openstack_composed/vm_without_firewall"

  providers = {
    openstack = openstack.scs
  }

  name         = "instance-${count.index}"
  flavor_name  = "SCS-16V:64:100"
  image_name   = "Ubuntu 22.04"
  fip_pool     = "ext01"
  network_name = "p500924-beermann-network"
}

module "oracle" {
  # do not increase, otherwise it will cost money!
  # do not reduce, otherwise you will loose data!
  count  = 1
  source = "./modules/oracle_composed/free_arm_vm"

  name      = "free-${count.index}"
  tenant_id = local.oci_tenant_ids[0]
  #ports     = [22, 80, 443, 6443, 7472, 7946]
  ports     = []
  image     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaad4jmvm7g54i3ur53o5pxfq4mfxem5eno24far7reitmnnqziyyga"
}

module "hetzner" {
  count  = 0
  source = "./modules/hetzner_composed/vm"

  name        = "instance-${count.index}"
  #server_type = "cx21" # 2C-4GB-40GB
  server_type = "cax11" # 2C-4GB-40GB
  location    = "fsn1"
  image       = "debian-12"
}
