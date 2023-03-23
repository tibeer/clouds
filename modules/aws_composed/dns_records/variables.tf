variable "zone" {}
variable "zone_id" {}
variable "type" {}

variable "records" {
  type = map(any)
}
