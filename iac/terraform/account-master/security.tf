# Probably will be done in the next steps...


# In the case of an incident requiring remediation, we recommend that a user with access to an
# administrative federated role within the AWS account perform the required remediation. In cases
# where this user is unavailable to carry out a time sensitive action, we recommend that a highly-
# restricted group or set of groups be preconfigured within your IdP, each providing appropriate
# federated access into the appropriate set of AWS accounts. A user can either be added into one of
# Use multi-factor authentication 22
# Organizing Your AWS Environment Using Multiple Accounts AWS Whitepaper
# these groups using a high-priority and temporary change request, or a select group of privileged
# and trusted users can be prepopulated into these groups.


# At least two IAM users with IAM logging credentials to prevent lockdown in case one of them
# is not available, and additional users depending on your operating model. Do not create
# unnecessary IAM privileged users in your management account. These users will assume roles in
# the member accounts in your organization through trust policies.


# • A break glass role that is deployed to all the accounts in the organization, and that can only be
# assumed by the break glass users from the management account. These roles are needed to
# allow access from the management account to apply and update guardrails, to troubleshoot and
# resolve issues with the automation tooling from the security tooling account, or to remediate
# security and operational issues in one of the member accounts in the AWS organization. When
# setting up these roles in your organization, you need to ensure they can be used in emergency
# Break glass access 23
# Organizing Your AWS Environment Using Multiple Accounts AWS Whitepaper
# situations, bypassing established controls under the situations described earlier in the paragraph,
# such as service control policies