module "oracle_prod" {
  # do not increase, otherwise it will cost money!
  # do not reduce, otherwise you will loose data!
  count  = var.enable_oracle_prod ? 1 : 0
  source = "./modules/oracle_composed/free_arm_vm"

  providers = {
    oci = oci.prod
  }

  name          = "control-plane"
  tenant_id     = jsondecode(data.config_ini.cfg_oracle_prod.json)["tenancy"]
  image_version = "22.04"
  ports         = []
}

module "oracle_beta" {
  # do not increase, otherwise it will cost money!
  # do not reduce, otherwise you will loose data!
  count  = var.enable_oracle_beta ? 1 : 0
  source = "./modules/oracle_composed/free_arm_vm"

  providers = {
    oci = oci.beta
  }

  name             = "node0"
  tenant_id        = jsondecode(data.config_ini.cfg_oracle_beta.json)["tenancy"]
  image_version    = "22.04"
  ports            = []
  cpus             = 2
  memory           = 12
  boot_bolume_size = 100
}

module "oracle_beta2" {
  # do not increase, otherwise it will cost money!
  # do not reduce, otherwise you will loose data!
  count  = var.enable_oracle_beta ? 1 : 0
  source = "./modules/oracle_composed/free_arm_vm"

  providers = {
    oci = oci.beta
  }

  name             = "node1"
  tenant_id        = jsondecode(data.config_ini.cfg_oracle_beta.json)["tenancy"]
  image_version    = "22.04"
  ports            = []
  cpus             = 2
  memory           = 12
  boot_bolume_size = 100
}

module "hetzner" {
  count  = var.enable_hetzner ? 1 : 0
  source = "./modules/hetzner_composed/vm"

  name        = "instance-${count.index}"
  server_type = "cax11"
  location    = "fsn1"
  image       = "ubuntu-22.04"
}

module "equinix" {
  count  = var.enable_equinix ? 1 : 0
  source = "./modules/equinix_composed/testing_env"

  name     = "instance-${count.index}"
  org_name = "tibeer"
}

module "google" {
  count  = var.enable_google ? 1 : 0
  source = "./modules/google_composed/free_vm"

  name                   = "instance-${count.index}"
  public_ptr_domain_name = "google.${var.dns_zone}"
}
