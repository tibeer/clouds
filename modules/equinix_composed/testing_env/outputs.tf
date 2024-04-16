output "public_ipv4" {
  value = module.instance.access_ip_v4
}

output "public_ipv6" {
  value = module.instance.access_ip_v6
}
