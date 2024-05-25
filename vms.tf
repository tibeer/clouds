module "oracle_prod" {
  # do not increase, otherwise it will cost money!
  # do not reduce, otherwise you will loose data!
  count  = var.enable_oracle_prod ? 1 : 0
  source = "./modules/oracle_composed/free_arm_vm"

  providers = {
    oci = oci.prod
  }

  name      = "free-${count.index}"
  tenant_id = jsondecode(data.config_ini.cfg_oracle_prod.json)["tenancy"]
  ports     = []
}

module "oracle_beta" {
  # do not increase, otherwise it will cost money!
  # do not reduce, otherwise you will loose data!
  count  = var.enable_oracle_beta ? 1 : 0
  source = "./modules/oracle_composed/free_arm_vm"

  providers = {
    oci = oci.beta
  }

  name      = "free-${count.index}"
  tenant_id = jsondecode(data.config_ini.cfg_oracle_beta.json)["tenancy"]
  ports     = []
}

module "hetzner" {
  count  = var.enable_hetzner ? 1 : 0
  source = "./modules/hetzner_composed/vm"

  name        = "instance-${count.index}"
  server_type = "cpx41"
  location    = "fsn1"
  image       = "ubuntu-22.04"
}

module "equinix" {
  count  = var.enable_equinix ? 1 : 0
  source = "./modules/equinix_composed/testing_env"

  name     = "instance-${count.index}"
  org_name = "tibeer"
}
