module "tibeerde" {
  source = "./modules/aws_composed/dns_zone"

  zone = "tibeer.de"
  caa_records = {
    "" = [
      "0 issue \"letsencrypt.org\""
    ]
  }
  a_records = {
    "" = [
      for host in module.oracle[*] :
        host.public_ipv4
    ],
    "oracle" = [
      for host in module.oracle[*] :
        host.public_ipv4
    ],
    "*.oracle" = [
      for host in module.oracle[*] :
        host.public_ipv4
    ],
  }
  aaaa_records = {
    "" = [
      for host in module.oracle[*] :
        host.public_ipv6
    ],
    "oracle" = [
      for host in module.oracle[*] :
        host.public_ipv6
    ],
    "*.oracle" = [
      for host in module.oracle[*] :
        host.public_ipv6
    ],
  }
}
