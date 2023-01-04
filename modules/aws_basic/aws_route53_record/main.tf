locals {
  name = var.name == null || var.name == "" ? var.zone : "${var.name}.${var.zone}"
}

resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = local.name
  type    = var.type
  ttl     = var.ttl
  records = var.records
}
