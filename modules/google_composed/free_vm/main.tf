data "google_client_config" "current" {}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "9.1.0"

  network_name = var.name
  project_id   = data.google_client_config.current.project
  subnets = [
    {
      subnet_name      = var.name
      subnet_ip        = "192.168.100.0/24"
      subnet_region    = data.google_client_config.current.region
      stack_type       = "IPV4_IPV6"
      ipv6_access_type = "EXTERNAL"
    }
  ]
  ingress_rules = [
    {
      name = "allow-all-ingress-ipv4"
      destination_ranges = [
        "0.0.0.0/0"
      ]
      source_ranges = [
        "0.0.0.0/0"
      ]
      allow = [
        {
          protocol = "all"
        }
      ]
    },
    {
      name = "allow-all-ingress-ipv6"
      destination_ranges = [
        "::/0"
      ]
      source_ranges = [
        "::/0"
      ]
      allow = [
        {
          protocol = "all"
        }
      ]
    }
  ]
  egress_rules = [
    {
      name = "allow-all-egress-ipv4"
      destination_ranges = [
        "0.0.0.0/0"
      ]
      source_ranges = [
        "0.0.0.0/0"
      ]
      allow = [
        {
          protocol = "all"
        }
      ]
    },
    {
      name = "allow-all-egress-ipv6"
      destination_ranges = [
        "::/0"
      ]
      source_ranges = [
        "::/0"
      ]
      allow = [
        {
          protocol = "all"
        }
      ]
    }
  ]
}

module "instance" {
  source = "../../google_basic/google_compute_instance"

  name                   = var.name
  machine_type           = var.machine_type
  disk_size              = var.disk_size
  network                = module.network.network_name
  subnetwork             = module.network.subnets_names[0]
  username               = var.username
  key_pair               = var.key_pair == null ? file(pathexpand(var.key_pair_path)) : var.key_pair
  public_ptr_domain_name = var.public_ptr_domain_name
}
