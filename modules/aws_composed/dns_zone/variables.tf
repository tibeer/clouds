variable "zone" {}

variable "a_records" {
  default = {}
  type    = map(any)
}

variable "aaaa_records" {
  default = {}
  type    = map(any)
}

variable "cname_records" {
  default = {}
  type    = map(any)
}

variable "caa_records" {
  default = {}
  type    = map(any)
}
