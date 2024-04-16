variable "name" {}
variable "project_id" {}

variable "flavor_name" {
  default = "c3.small.x86"
}

variable "image_name" {
  default = "ubuntu_22_04"
}

variable "billing_cycle" {
  default = "hourly"
}

variable "metro" {
  default = "fr"
}

variable "project_ssh_key_ids" {
  default = null
}
