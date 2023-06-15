output "public_ipv4" {
  value = module.instance.public_ip
}

output "public_ipv6" {
  value = module.ipv6_address.ip_address
}
