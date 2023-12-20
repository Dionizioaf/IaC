

output "organization_account_ids" {
  description = "ids of the organization accounts"
  value       = data.aws_organizations_organization.organization.accounts[*].id
}
