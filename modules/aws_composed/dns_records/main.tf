module "record" {
  source = "../../aws_basic/aws_route53_record"
  for_each = var.records

  zone    = var.zone
  zone_id = var.zone_id
  name    = each.key
  records = each.value
  type    = var.type
}
