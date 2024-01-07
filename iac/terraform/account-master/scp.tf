

# Disable Cloutrail configuration outsite master account

# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "Stmt1234567890123",
#             "Effect": "Deny",
#             "Action": [
#                 "cloudtrail:AddTags",
#                 "cloudtrail:CreateTrail",
#                 "cloudtrail:DeleteTrail",
#                 "cloudtrail:RemoveTags",
#                 "cloudtrail:StartLogging",
#                 "cloudtrail:StopLogging",
#                 "cloudtrail:UpdateTrail"
#             ],
#             "Resource": [
#                 "*"
#             ]
#         }
#     ]
# }



# Control service that are approved or disaproved to be used in the account

# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Sid": "Stmt1111111111111",
#             "Effect": "Allow",
#             "Action": [ 
#                 "ec2:*",
#                 "elasticloadbalancing:*",
#                 "codecommit:*",
#                 "cloudtrail:*",
#                 "codedeploy:*"
#               ],
#             "Resource": [ "*" ]
#         }
#     ]
# }



# Connect SCP to OU

# POSSIBLE SCP
# Block member accounts from leaving organization - Apply at root ou

# Tag POlicies
# Opt-Out Policies
# Backup Policies


# We recommend SCPs be applied to the
# Security OU preventing modification or deletion of files within the centralized logging S3 bucket(s).
# Additionally, the use of S3 bucket versioning provides visibility into the complete history of all log
# files.



# TAG: create a automation to add who created the resource


locals {
  TagsExist         = var.scp_tag_enforce.tags
  TagsExistAccounts = var.scp_tag_enforce.accounts

}


# TAG: create a control not permiting to create resource without tag
# This implementation will anywhere possible cancel the creation of a resource without tag informed in var.tag_enforce.check" {
# The error when this happen is a little confuse, so remenber this implementation.   

resource "aws_organizations_policy" "tagging_policy" {
  name        = "DenyResourceCreationWithoutTags"
  description = "SCP to deny resource creation without required tags"

  content = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": "*",
      "Resource": "*",
      "Condition": {
        "ForAllValues:StringEquals": ${jsonencode(local.TagsExist)}
      }
    }
  ]
}
EOF
}

resource "aws_organizations_policy_attachment" "attach_policy" {
  count = length(local.TagsExistAccounts)

  policy_id = aws_organizations_policy.tagging_policy.id
  target_id = [for ou in aws_organizations_organizational_unit.ou : ou.id if ou.name == local.TagsExistAccounts[count.index]][0]
}





# Ref during development: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples.html#example-scp-tag-enforce
