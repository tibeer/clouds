terraform {
  cloud {
    organization = "tibeer"

    workspaces {
      name = "clouds"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    oci = {
      source = "oracle/oci"
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

provider "hcloud" {
  token = "0000000000000000000000000000000000000000000000000000000000000000"
}
