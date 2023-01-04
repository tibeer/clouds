variable "tenant_id" {}
variable "name" {}
variable "vcn_id" {}

variable "protocol" {
  # all = all
  # 1 = ICMP
  # 6 = TCP
  # 17 = UDP
  # 58 = ICMPv6
}

# either (port) or (from_port, to_port) have to be set
variable "port" {
  default = null
}
variable "from_port" {
  default = null
}
variable "to_port" {
  default = null
}
