variable "zone_id" {}
variable "zone" {}

variable "name" {
  default = null
}

variable "records" {
  type = list(any)
}

variable "type" {
  default = "A"
}

variable "ttl" {
  default = "300"
}
