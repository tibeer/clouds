output "regiocloud" {
  value = [
    for host in module.regiocloud[*]:
      host.floating_ip
  ]
}

output "pluscloudopen" {
  value = [
    for host in module.pluscloudopen[*]:
      host.floating_ip
  ]
}

output "oracle" {
  value = [
    for host in module.oracle[*]:
      host.public_ip
  ]
}
