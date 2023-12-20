
# Governance holds the security & payer accounts
# resource "aws_organizations_organizational_unit" "governance_ou" {
#   name      = "Governance"
#   parent_id = aws_organizations_organization.org.roots[0].id
# }