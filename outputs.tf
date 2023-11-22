#output "regiocloud" {
#  value = [
#    for host in module.regiocloud[*]:
#      host.floating_ip
#  ]
#}
#
#output "pluscloudopen" {
#  value = [
#    for host in module.pluscloudopen[*]:
#      host.floating_ip
#  ]
#}

output "hetzner_ipv4" {
  value = [
    for host in module.hetzner[*]:
      host.ipv4_address
  ]
}

output "hetzner_ipv6" {
  value = [
    for host in module.hetzner[*]:
      host.ipv6_address
  ]
}

output "oracle_ipv4" {
  value = [
    for host in module.oracle[*]:
      host.public_ipv4
  ]
}

output "oracle_ipv6" {
  value = [
    for host in module.oracle[*]:
      host.public_ipv6
  ]
}
