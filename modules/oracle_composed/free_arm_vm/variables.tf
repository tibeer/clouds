variable "name" {}
variable "tenant_id" {}

variable "key_pair" {
  default = null
}

variable "ports" {
  type    = list(any)
  default = [22]
}
