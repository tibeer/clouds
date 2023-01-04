variable "domain_name" {
  default = "tibeer.de"
}

variable "name_servers" {
  default = [
    "ns-818.awsdns-38.net",
    "ns-365.awsdns-45.com",
    "ns-1532.awsdns-63.org",
    "ns-1652.awsdns-14.co.uk"
  ]
}

variable "transfer_lock" {
  default = false
}
