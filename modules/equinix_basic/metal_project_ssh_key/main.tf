resource "equinix_metal_project_ssh_key" "ssh_key" {
  name       = var.name
  public_key = file(pathexpand(var.path))
  project_id = var.project_id
}
