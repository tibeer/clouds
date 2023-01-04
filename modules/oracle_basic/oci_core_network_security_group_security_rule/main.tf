locals {
  icmp_options = var.protocol == 1 || var.protocol == 58 ? [""] : []
  tcp_options  = var.protocol == 6 ? [""] : []
  udp_options  = var.protocol == 17 ? [""] : []
}

resource "oci_core_network_security_group_security_rule" "secgroup_rule" {
  network_security_group_id = var.nsg_id
  direction                 = var.direction
  protocol                  = var.protocol

  source_type = var.direction == "INGRESS" ? "CIDR_BLOCK" : null
  source = var.is_ipv6_rule ? "::/0" : "0.0.0.0/0"

  destination_type = var.direction == "EGRESS" ? "CIDR_BLOCK" : null
  destination = var.is_ipv6_rule ? "::/0" : "0.0.0.0/0"

  dynamic "icmp_options" {
    for_each = local.icmp_options
    content {
      type = var.from_port
      code = var.to_port
    }
  }

  dynamic "tcp_options" {
    for_each = local.tcp_options
    content {
      destination_port_range{
        min = var.from_port
        max = var.to_port
      }
    }
  }

  dynamic "udp_options" {
    for_each = local.udp_options
    content {
      destination_port_range{
        min = var.from_port
        max = var.to_port
      }
    }
  }
}
