#variable "gardener" {
#  default = "167.235.219.201"
#}
#
#variable "timgardener" {
#  default = "128.140.24.153"
#}

module "tibeerde" {
  source = "./modules/aws_composed/dns_zone"

  zone = "tibeer.de"
  a_records = {
    "oracle" = [
      for host in module.oracle[*]:
        host.public_ipv4
    ],
    "*.oracle" = [
      for host in module.oracle[*]:
        host.public_ipv4
    ],
    "kamaji" = ["67.235.216.66"]
    "*.kamaji" = ["67.235.216.66"],
#    "gardener"      = [var.gardener],
#    "*.gardener"    = [var.gardener],
#    "timgardener"   = [var.timgardener],
#    "*.timgardener" = [var.timgardener]
  }
  aaaa_records = {
    "oracle" = [
      for host in module.oracle[*]:
        host.public_ipv6
    ],
    "*.oracle" = [
      for host in module.oracle[*]:
        host.public_ipv6
    ],
  }
}
