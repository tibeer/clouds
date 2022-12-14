variable "name" {}

variable "from_port" {
  default = 22
}

variable "to_port" {
  default = 22
}

variable "cidr" {
  default = "0.0.0.0/0"
}

variable "ip_protocol" {
  default = "tcp"
}