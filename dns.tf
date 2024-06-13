module "tibeerde" {
  source = "./modules/aws_composed/dns_zone"

  zone = "tibeer.de"
  a_records = {
    "" = [
      for host in module.oracle_prod[*] :
      host.public_ipv4
    ],
    "oracle" = [
      for host in module.oracle_prod[*] :
      host.public_ipv4
    ],
    "*.oracle" = [
      for host in module.oracle_prod[*] :
      host.public_ipv4
    ],
    "beta" = [
      for host in module.oracle_beta[*] :
      host.public_ipv4
    ],
    "*.beta" = [
      for host in module.oracle_beta[*] :
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
    "oracle" = [
      for host in module.oracle_prod[*] :
      host.public_ipv6
    ],
    "*.oracle" = [
      for host in module.oracle_prod[*] :
      host.public_ipv6
    ],
    "beta" = [
      for host in module.oracle_beta[*] :
      host.public_ipv6
    ],
    "*.beta" = [
      for host in module.oracle_beta[*] :
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
