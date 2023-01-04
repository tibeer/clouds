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

variable "ports" {
  type    = list(any)
  default = null
}
