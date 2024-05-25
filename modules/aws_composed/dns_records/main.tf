module "record" {
  source = "../../aws_basic/aws_route53_record"

  # loop over all records and ignore empty lists
  for_each = {
    for name, records in var.records :
    name => records if length(records) > 0
  }

  zone    = var.zone
  zone_id = var.zone_id
  name    = each.key
  records = each.value
  type    = var.type
}
