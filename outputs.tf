output "betacloud" {
  value = [
    for host in module.betacloud[*]:
      host.floating_ip
  ]
}

output "oracle" {
  value = [
    for host in module.oracle[*]:
      host.public_ip
  ]
}
