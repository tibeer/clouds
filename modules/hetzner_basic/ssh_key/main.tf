resource "hcloud_ssh_key" "key" {
  name       = var.name
  public_key = file(pathexpand(var.path))
}
