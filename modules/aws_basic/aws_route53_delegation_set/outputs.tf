output "arn" {
  value = aws_route53_delegation_set.delegation_set.arn
}

output "id" {
  value = aws_route53_delegation_set.delegation_set.id
}

output "name_servers" {
  value = aws_route53_delegation_set.delegation_set.name_servers
}
