

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