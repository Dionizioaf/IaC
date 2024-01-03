

output "organization_account_ids" {
  description = "ids of the organization accounts"
  value       = data.aws_organizations_organization.organization.accounts[*].id
}

output "organization_units" {
  description = "ids of the organization units"
  value       = aws_organizations_organizational_unit.ou[*].id
}