variable "name" {}
variable "ssh_keys" {}

variable "image" {
  default = "ubuntu-22.04"
}

variable "location" {
  default = "hel1"
}

variable "server_type" {
  default = "cx11"
}

variable "ipv4_enabled" {
  default = true
}

variable "ipv6_enabled" {
  default = true
}
