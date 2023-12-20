locals {
    default_tags = var.default_tags
    ops_profile = var.ops_profile
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}



#
# Create Default Provider
#
provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = local.default_tags
  }
}

#
# Create The Ops Account that will hold the Terraform state
#
provider "aws" {
  alias  = "ops-account"
  region = "us-west-2"
  profile = local.ops_profile
#   assume_role {
#     role_arn = "arn:aws:iam::${module.security_account.account_id}:role/OrganizationAccountAccessRole"
#   }
  default_tags {
    tags = var.default_tags
  }
}