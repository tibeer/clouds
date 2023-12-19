variable "name" {}
variable "shape_name" {}
variable "subnet_id" {}
variable "availability_domain" {}
variable "tenant_id" {}
variable "source_id" {}
variable "nsg_ids" {
  type = list(any)
}

variable "shape_config" {
  default = null
}

variable "key_pair" {
  default = null
}

variable "source_type" {
  default = "image"
}

variable "boot_bolume_size" {
  default = null
}
