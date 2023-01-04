output "public_ip" {
  value = module.instance.public_ip
}

# This does not work currently!
#output "public_ipv6" {
#  value = module.ipv6_address.ip_address
#}
