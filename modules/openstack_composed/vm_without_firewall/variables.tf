variable "name" {}
variable "flavor_name" {}
variable "image_name" {}
variable "network_name" {}
variable "fip_pool" {}

variable "availability_zone" {
  default = null
}

variable "key_pair" {
  default = null
}
