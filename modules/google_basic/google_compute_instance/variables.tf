variable "name" {}
variable "disk_size" {}
variable "machine_type" {}
variable "network" {}
variable "subnetwork" {}
variable "username" {
  default = "tux"
}
variable "key_pair" {
  default = null
}
variable "image" {
  default = "debian-cloud/debian-12"
}
variable "public_ptr_domain_name" {
  default = null  
}
