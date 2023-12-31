
/**
  * # main.md
  *
  *  In the main.tf i usually code functions or datas to help other files
  */

data "external" "get_caller_identity" {
  program = ["aws", "sts", "get-caller-identity"]
}

data "aws_regions" "current" {}
