

output "organization_accounts" {
  description = "ids of the organization accounts"
  value       = data.aws_organizations_organization.organization.accounts[*]
}

output "organization_member_accounts" {
  description = "ids of the members accounts"
  value       = aws_organizations_account.member-accounts
}