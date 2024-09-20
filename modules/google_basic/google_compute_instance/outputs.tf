#output "public_ipv4" {
#  value = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
#}

output "public_ipv6" {
  value = google_compute_instance.instance.network_interface[0].ipv6_access_config[0].external_ipv6
}
