module "oracle" {
  # do not increase, otherwise it will cost money!
  # do not reduce, otherwise you will loose data!
  count  = 1
  source = "./modules/oracle_composed/free_arm_vm"

  name      = "free-${count.index}"
  tenant_id = local.oci_tenant_ids[0]
  #ports     = [22, 80, 443, 6443, 7472, 7946]
  ports     = []
  #image     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaad4jmvm7g54i3ur53o5pxfq4mfxem5eno24far7reitmnnqziyyga"
  image     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaamz33pxpdxvdi5lkmhux6v6sbmysrho6jt4aqrtvhrjjganqadxta"
}

module "hetzner" {
  count  = 0
  source = "./modules/hetzner_composed/vm"

  name        = "instance-${count.index}"
  server_type = "cax11" # 2C-4GB-40GB
  location    = "fsn1"
  image       = "ubuntu-22.04"
}
