variable "nsg_id" {}

variable "direction" {
  default = "EGRESS"
}

variable "protocol" {
  # all = all
  # 1 = ICMP
  # 6 = TCP
  # 17 = UDP
  # 58 = ICMPv6
}

variable "from_port" {
  default = null
}

variable "to_port" {
  default = null
}

variable "is_ipv6_rule" {
  default = false
}
