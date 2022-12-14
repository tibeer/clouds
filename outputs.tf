output "betacloud-mirror" {
  value = [
    for host in module.betacloud-mirror[*]:
      host.floating_ip
  ]
}

output "betacloud-vpn" {
  value = [
    for host in module.betacloud-vpn[*]:
      host.floating_ip
  ]
}

