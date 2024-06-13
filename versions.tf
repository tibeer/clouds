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
    google = {
      source = "hashicorp/google"
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

provider "google" {
  project = "tibeer"
  region  = "us-central1"
  zone    = "us-central1-b"
}
