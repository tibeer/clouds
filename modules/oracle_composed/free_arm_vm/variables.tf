variable "name" {}
variable "tenant_id" {}

variable "key_pair" {
  default = null
}

variable "key_pair_path" {
  default = "~/.ssh/id_ed25519.pub"
}

variable "image" {
  default = null
}

variable "ports" {
  type    = list(any)
  default = [22]
}
