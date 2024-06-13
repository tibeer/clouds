resource "google_compute_instance" "instance" {
  name         = var.name
  machine_type = var.machine_type

  metadata = {
    ssh-keys = "${var.username}:${var.key_pair}"
  }

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    stack_type = "IPV4_IPV6"

    # generate an ephemeral public IPv4 address
    access_config {}
    # generate an ephemeral public IPv6 address
    ipv6_access_config {
      # STANDARD is not working, PREMIUM is required for an unknown reason
      network_tier = "PREMIUM"
    }
  }
}
