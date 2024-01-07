/**
  * # members-account.tf
  *
  *  In the members-account.tf file, you will create the member accounts that will be part of your organization
  */

locals {
  # Use local variable so its easier to change the source of files if needed
  organization_member_accounts = var.organization_member_accounts
}

resource "aws_organizations_account" "member-accounts" {
  for_each = { for idx, obj in local.organization_member_accounts : idx => obj }

  name                       = each.value.name
  email                      = each.value.email
  close_on_deletion          = each.value.delete_on_termination
  iam_user_access_to_billing = each.value.enable_billing_panel ? "ALLOW" : "DENY"
  role_name                  = "OrganizationRole"
  parent_id                  = each.value.ou_name == "root" ? local.root_ou : [for ou in aws_organizations_organizational_unit.ou : ou.id if ou.name == each.value.ou_name][0]
  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = [role_name]
  }
}
