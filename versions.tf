terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    oci = {
      source = "hashicorp/oci"
    }
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "aws" {}
provider "oci" {}

provider "openstack" {
  cloud = "scs-community-beermann"
  alias = "scs"
}

provider "openstack" {
  cloud = "beermann"
  alias = "betacloud"
}
