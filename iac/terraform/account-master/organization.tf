locals {
    organization_services = var.organization_services
    policy_types = var.organization_policy_types
}

resource "aws_organizations_organization" "organization" {
    aws_service_access_principals = local.organization_services
    enabled_policy_types = local.policy_types
    feature_set = "ALL"
}
