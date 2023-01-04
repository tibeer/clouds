resource "aws_route53_zone" "zone" {
  name              = var.zone
  delegation_set_id = var.delegation_set_id
}
