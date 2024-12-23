variable "name" {}
variable "tenant_id" {}

variable "key_pair" {
  default = null
}

variable "key_pair_path" {
  default = "~/.ssh/id_ed25519.pub"
}

variable "image_version" {
  default = null
}

variable "ports" {
  type    = list(any)
  default = [22]
}

variable "cpus" {
  default = 4
}

variable "memory" {
  default = 24
}

variable "boot_bolume_size" {
  default = 200
}
