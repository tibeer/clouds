terraform {
  cloud {
    organization = "tibeer"

    workspaces {
      name = "clouds"
    }

    hostname = "app.terraform.io"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    config = {
      source = "alabuel/config"
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
provider "config" {}
provider "equinix" {}
provider "hcloud" {}

provider "oci" {
  alias               = "prod"
  config_file_profile = "PROD"
}

provider "oci" {
  alias               = "beta"
  config_file_profile = "BETA"
}

provider "openstack" {
  cloud = "scs-community-beermann"
  alias = "scs"
}

provider "openstack" {
  cloud = "beermann"
  alias = "regiocloud"
}
