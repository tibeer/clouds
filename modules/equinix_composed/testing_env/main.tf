module "get_org" {
  source = "../../equinix_basic/get_metal_organization"

  name = var.org_name
}

module "project" {
  source = "../../equinix_basic/metal_project"

  name            = var.name
  organization_id = module.get_org.id
}

module "vlan" {
  source = "../../equinix_basic/metal_vlan"

  name       = var.name
  project_id = module.project.id
}

module "key" {
  source = "../../equinix_basic/metal_project_ssh_key"

  name       = var.name
  project_id = module.project.id
}

module "instance" {
  source = "../../equinix_basic/metal_device"

  name                = var.name
  project_id          = module.project.id
  project_ssh_key_ids = [module.key.id]
}
