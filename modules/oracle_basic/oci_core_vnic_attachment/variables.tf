variable "instance_id" {}
variable "subnet_id" {}
variable "nsg_ids" {
  type = list(any)
}
