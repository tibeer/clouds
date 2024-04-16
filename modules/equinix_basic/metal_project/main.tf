resource "equinix_metal_project" "project" {
  organization_id = var.organization_id
  name            = var.name
}
