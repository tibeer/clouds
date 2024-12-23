module "tibeerde" {
  source = "./modules/aws_composed/dns_zone"

  zone = var.dns_zone
  a_records = {
    "" = [
      for host in module.oracle_prod[*] :
      host.public_ipv4
    ],
    "www" = [
      for host in module.oracle_prod[*] :
      host.public_ipv4
    ],
    "cloud" = [
      for host in module.oracle_prod[*] :
      host.public_ipv4
    ],
    "*.cloud" = [
      for host in module.oracle_prod[*] :
      host.public_ipv4
    ],
    "node0" = [
      for host in module.oracle_beta[*] :
      host.public_ipv4
    ],
    "*.node0" = [
      for host in module.oracle_beta[*] :
      host.public_ipv4
    ],
    "node1" = [
      for host in module.oracle_beta2[*] :
      host.public_ipv4
    ],
    "*.node1" = [
      for host in module.oracle_beta2[*] :
      host.public_ipv4
    ],
    "hetzner" = [
      for host in module.hetzner[*] :
      host.ipv4_address
    ],
    "*.hetzner" = [
      for host in module.hetzner[*] :
      host.ipv4_address
    ],
    "equinix" = [
      for host in module.equinix[*] :
      host.public_ipv4
    ],
    "*.equinix" = [
      for host in module.equinix[*] :
      host.public_ipv4
    ],
    "google" = [
      for host in module.google[*] :
      host.public_ipv4
    ],
    "*.google" = [
      for host in module.google[*] :
      host.public_ipv4
    ],
  }
  aaaa_records = {
    "" = [
      for host in module.oracle_prod[*] :
      host.public_ipv6
    ],
    "www" = [
      for host in module.oracle_prod[*] :
      host.public_ipv6
    ],
    "cloud" = [
      for host in module.oracle_prod[*] :
      host.public_ipv6
    ],
    "*.cloud" = [
      for host in module.oracle_prod[*] :
      host.public_ipv6
    ],
    "node0" = [
      for host in module.oracle_beta[*] :
      host.public_ipv6
    ],
    "*.node0" = [
      for host in module.oracle_beta[*] :
      host.public_ipv6
    ],
    "node1" = [
      for host in module.oracle_beta2[*] :
      host.public_ipv6
    ],
    "*.node1" = [
      for host in module.oracle_beta2[*] :
      host.public_ipv6
    ],
    "hetzner" = [
      for host in module.hetzner[*] :
      host.ipv6_address
    ],
    "*.hetzner" = [
      for host in module.hetzner[*] :
      host.ipv6_address
    ],
    "equinix" = [
      for host in module.equinix[*] :
      host.public_ipv6
    ],
    "*.equinix" = [
      for host in module.equinix[*] :
      host.public_ipv6
    ],
    "google" = [
      for host in module.google[*] :
      host.public_ipv6
    ],
    "*.google" = [
      for host in module.google[*] :
      host.public_ipv6
    ],
  }
  caa_records = {
    "" = [
      "0 issue \"letsencrypt.org\""
    ]
  }
  cname_records = {}
}
