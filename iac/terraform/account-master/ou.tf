locals {
  organization_units = var.organization_units
  root_ou = aws_organizations_organization.org.roots[0].id

}
# Create OUS
resource "aws_organizations_organizational_unit" "ou" {
  for_each                   = local.organization_member_accounts
  name                       = each.value["name"]
  parent_id = each.value["parent_id"] == "root" ? local.root_ou : ""
  // TODO: how do i get dynamic parent_id?
}