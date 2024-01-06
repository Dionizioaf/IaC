
/**
  * # main.tf
  *
  *  In the main.tf i usually code functions or datas to help other files
  */

data "external" "get_caller_identity" {
  program = ["aws", "sts", "get-caller-identity"]
}

data "aws_region" "current" {}

data "aws_organizations_organization" "organization" {}

data "aws_organizations_organizational_units" "root" {
  parent_id = data.aws_organizations_organization.organization.roots[0].id
}