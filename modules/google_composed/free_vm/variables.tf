variable "name" {}
variable "path" {
  default = "~/.ssh/id_ed25519.pub"
}
variable "key_pair" {
  default = null
}

variable "key_pair_path" {
  default = "~/.ssh/id_ed25519.pub"
}
