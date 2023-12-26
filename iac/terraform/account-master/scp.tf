

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