variable "name" {}
variable "machine_type" {
  default = "e2-micro"
}
variable "disk_size" {
  default = 30
}
variable "username" {
  default = "debian"
}
variable "key_pair" {
  default = null
}
variable "key_pair_path" {
  default = "~/.ssh/id_ed25519.pub"
}
variable "public_ptr_domain_name" {
  default = null
}
