module "secgroup" {
  source = "../ingress_secgroup"
  count  = length(var.ports)

  vcn_id    = var.vcn_id
  name      = var.name
  tenant_id = var.tenant_id
  protocol  = var.protocol
  port      = var.ports[count.index]
}
