output "hetzner_ipv4" {
  value = [
    for host in module.hetzner[*] :
    host.ipv4_address
  ]
}

output "hetzner_ipv6" {
  value = [
    for host in module.hetzner[*] :
    host.ipv6_address
  ]
}

output "oracle_prod_ipv4" {
  value = [
    for host in module.oracle_prod[*] :
    host.public_ipv4
  ]
}

output "oracle_prod_ipv6" {
  value = [
    for host in module.oracle_prod[*] :
    host.public_ipv6
  ]
}
