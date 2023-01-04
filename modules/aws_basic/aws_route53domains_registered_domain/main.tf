resource "aws_route53domains_registered_domain" "domain" {
  domain_name = var.domain_name
  transfer_lock = var.transfer_lock
  
  dynamic "name_server" {
    for_each = var.name_servers

    content {
      name = name_server.value
    }
  }
}
