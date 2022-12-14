variable "name" {}

variable "security_groups" {
  type = list(any)
}

variable "key_pair" {
  default = null
}

variable "availability_zone" {
  default = "south-2"
}

variable "flavor_name" {
  default = "2C-2GB-10GB"
}

variable "image_name" {
  default = "Ubuntu 20.04"
}

variable "network_name" {
  default = "net-to-external-beermann"
}
