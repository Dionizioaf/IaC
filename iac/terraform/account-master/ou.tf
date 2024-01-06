/**
  * ou.tf
  *
  *  In the ou.tf file, it will create the organizational units that will be part of your organization
  */
locals {
  organization_units = var.organization_units
  root_ou            = aws_organizations_organization.organization.id

}

# Create OUS
resource "aws_organizations_organizational_unit" "ou" {
  for_each = { for idx, obj in local.organization_units : idx => obj }

  name      = each.value.name
  parent_id = each.value.parent_id == "root" ? local.root_ou : ""
  // TODO: how do i get dynamic parent_id if its a internal account?
}
