
# Governance holds the security & payer accounts
# resource "aws_organizations_organizational_unit" "governance_ou" {
#   name      = "Governance"
#   parent_id = aws_organizations_organization.org.roots[0].id
# }


# Create OUS
resource "aws_organizations_organizational_unit" "governance_ou" {
  name      = "Governance"
  parent_id = aws_organizations_organization.org.roots[0].id
}

# Configure member accounts in a OU

# Sandbox
# Business Continuity
# Deployments
# Security
# Ingraestructure -> DEVOPS AND INFRA ACCOUNT RESOURCES
# Suspended
# Workloads -> For guidance on where to contain non-infrastructure shared services, refer to Workloads OU