output "nsg_ids" {
  value = [
    for group in module.secgroup[*]:
      group.id
  ]
}
