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
    hcloud = {
      source = "hetznercloud/hcloud"
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
  alias = "regiocloud"
}

provider "hcloud" {
  # Now derived from HCLOUD_TOKEN environment variable
  #token = "0000000000000000000000000000000000000000000000000000000000000000"
}
