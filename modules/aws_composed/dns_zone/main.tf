module "delegation_set" {
  source = "../../aws_basic/aws_route53_delegation_set"

  name = var.zone
}

module "zone" {
  source = "../../aws_basic/aws_route53_zone"

  zone              = var.zone
  delegation_set_id = module.delegation_set.id
}

module "domain" {
  source = "../../aws_basic/aws_route53domains_registered_domain"

  domain_name  = var.zone
  name_servers = module.delegation_set.name_servers
}

module "records" {
  source = "../dns_records"

  zone    = var.zone
  zone_id = module.zone.zone_id
  records = var.records
}
