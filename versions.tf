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
    equinix = {
      source = "equinix/equinix"
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
provider "equinix" {}
provider "hcloud" {}
provider "oci" {}

provider "openstack" {
  cloud = "scs-community-beermann"
  alias = "scs"
}

provider "openstack" {
  cloud = "beermann"
  alias = "regiocloud"
}
