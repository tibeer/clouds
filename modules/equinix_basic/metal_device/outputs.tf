output "id" {
  value = equinix_metal_device.instance.id
}

output "name" {
  value = equinix_metal_device.instance.hostname
}

output "access_ip_v4" {
  value = equinix_metal_device.instance.access_public_ipv4
}

output "access_ip_v6" {
  value = equinix_metal_device.instance.access_public_ipv6
}
