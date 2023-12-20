locals {
  organization_member_accounts = var.organization_member_accounts
}

resource "aws_organizations_account" "development" {
  for_each                   = local.organization_member_accounts
  name                       = each.value["name"]
  email                      = each.value["email"]
  close_on_deletion          = each.value["delete_on_termination"]
  iam_user_access_to_billing = each.value["enable_billing_panel"] ? "ALLOW" : "DENY"
  role_name                  = "OrganizationRole"

  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = [role_name]
  }
}
