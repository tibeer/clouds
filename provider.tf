provider "openstack" {
  cloud = "scs-community-beermann"
  alias = "scs"
}

provider "openstack" {
  cloud = "beermann"
  alias = "betacloud"
}
