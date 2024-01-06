
default_tags = {
  terraform : true,
  owner : "opslife",
}

organization_services = [
  "cloudtrail.amazonaws.com",
  "config.amazonaws.com",
]

organization_policy_types = [
  "AISERVICES_OPT_OUT_POLICY",
  "BACKUP_POLICY",
  "SERVICE_CONTROL_POLICY",
  "TAG_POLICY"
]



organization_member_accounts = [{
  name                  = "Network"
  email                 = "awsnetwork@opslife.com.br"
  delete_on_termination = true
  enable_billing_panel  = false
  ou_name               = "Infrastructure"
  }, {
  name                  = "Shared Infra"
  email                 = "awssharedinfra@opslife.com.br"
  delete_on_termination = true
  enable_billing_panel  = false
  ou_name               = "Infrastructure"
  }, {
  name                  = "production"
  email                 = "awsproduction@opslife.com.br"
  delete_on_termination = true
  enable_billing_panel  = false
  ou_name               = "Deployments"
  }, {
  name                  = "development"
  email                 = "awsdevelopment@opslife.com.br",
  delete_on_termination = true
  enable_billing_panel  = false
  ou_name               = "Deployments"
  }, {
  name                  = "Log archive"
  email                 = "awslogarchive@opslife.com.br",
  delete_on_termination = true
  enable_billing_panel  = false
  ou_name               = "Security"
  }, {
  name                  = "Security Tooling"
  email                 = "awssectooling@opslife.com.br",
  delete_on_termination = true
  enable_billing_panel  = false
  ou_name               = "Security"
  }, {
  name                  = "Monitoring"
  email                 = "awsmonitoring@opslife.com.br",
  delete_on_termination = true
  enable_billing_panel  = false
  ou_name               = "Workloads"
  }, {
  name                  = "BS Production"
  email                 = "bsprod@opslife.com.br",
  delete_on_termination = true
  enable_billing_panel  = false
  ou_name               = "Business Continuity"
}]


organization_units = [{
  name      = "Governance"
  parent_id = "root"
  }, {
  name      = "Deployments"
  parent_id = "root"
  }, {
  name      = "Security"
  parent_id = "root"
  }, {
  name      = "Infrastructure"
  parent_id = "root"
  }, {
  name      = "Suspended"
  parent_id = "root"
  }, {
  name      = "Workloads"
  parent_id = "root"
  }, {
  name      = "Business Continuity"
  parent_id = "root"
}]





// TODO: https://github.com/Dionizioaf/OpsLife-IaC/issues/8
control_tower_config = [
  {
    control_names = [
      "AWS-GR_ENCRYPTED_VOLUMES",
      "AWS-GR_EBS_OPTIMIZED_INSTANCE",
      "AWS-GR_EC2_VOLUME_INUSE_CHECK",
      "AWS-GR_RDS_INSTANCE_PUBLIC_ACCESS_CHECK",
      "AWS-GR_RDS_SNAPSHOTS_PUBLIC_PROHIBITED",
      "AWS-GR_RDS_STORAGE_ENCRYPTED",
      "AWS-GR_RESTRICTED_COMMON_PORTS",
      "AWS-GR_RESTRICTED_SSH",
      "AWS-GR_RESTRICT_ROOT_USER",
      "AWS-GR_RESTRICT_ROOT_USER_ACCESS_KEYS",
      "AWS-GR_ROOT_ACCOUNT_MFA_ENABLED",
      "AWS-GR_S3_BUCKET_PUBLIC_READ_PROHIBITED",
      "AWS-GR_S3_BUCKET_PUBLIC_WRITE_PROHIBITED",
    ],
    organizational_unit_ids = ["Workloads", "Suspended"],
  },
  {
    control_names = [
      "AWS-GR_SUBNET_AUTO_ASSIGN_PUBLIC_IP_DISABLED",
      "AWS-GR_AUTOSCALING_LAUNCH_CONFIG_PUBLIC_IP_DISABLED",
      "AWS-GR_DISALLOW_CROSS_REGION_NETWORKING",
      "AWS-GR_DISALLOW_VPC_INTERNET_ACCESS",
      "AWS-GR_DISALLOW_VPN_CONNECTIONS",
      "AWS-GR_DMS_REPLICATION_NOT_PUBLIC",
      "AWS-GR_EBS_SNAPSHOT_PUBLIC_RESTORABLE_CHECK",
      "AWS-GR_EC2_INSTANCE_NO_PUBLIC_IP",
      "AWS-GR_EKS_ENDPOINT_NO_PUBLIC_ACCESS",
      "AWS-GR_ELASTICSEARCH_IN_VPC_ONLY",
      "AWS-GR_EMR_MASTER_NO_PUBLIC_IP",
      "AWS-GR_LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED",
      "AWS-GR_NO_UNRESTRICTED_ROUTE_TO_IGW",
      "AWS-GR_REDSHIFT_CLUSTER_PUBLIC_ACCESS_CHECK",
      "AWS-GR_S3_ACCOUNT_LEVEL_PUBLIC_ACCESS_BLOCKS_PERIODIC",
      "AWS-GR_SAGEMAKER_NOTEBOOK_NO_DIRECT_INTERNET_ACCESS",
      "AWS-GR_SSM_DOCUMENT_NOT_PUBLIC",
    ],
    organizational_unit_ids = ["Workloads"],
  },
]



# CI/CD accounts
# CI/CD based of resources group - Ex APP1 em prod e dev with ame CI/CD account
# CI/CD for monitoring plataforms using same CI/CD
# For example, your CI jobs and CD pipelines typically need write access to publish and promote
# candidate artifacts to an artifact management service. However, your production workload
# environments should only require read access to artifact management services in order to obtain
# the already built and promoted artifacts


# organization_member_accounts_tags = {
#   production : {
#     terraform : true,
#     owner : opslife,
#   },
#   development : {
#     terraform : true,
#     owner : opslife,
#   },
# }


# Common examples of AWS services
# Common examples of security capabilities and AWS services that can be centrally accessed and
# managed via the Operations tooling account include:
# • AWS Systems Manager — If you intend to use AWS Systems Manager across your organization,
# we recommend that you specify one of your operations accounts as the delegated administrator
# for AWS Systems Manager.
# Operations tooling account(s) 34
# Organizing Your AWS Environment Using Multiple Accounts AWS Whitepaper
# • AWS Backup — If you intend to use AWS Backup across your organization, we recommend that
# you specify one of your operations accounts as the delegated administrator for AWS Backup


# Examples of services or functions within the Shared Services accounts
# • AWS IAM Identity Center — We recommend that you use AWS IAM Identity Center to enable
# federated access to all accounts in your organization. You can specify one of your Shared
# Services accounts as the delegated administrator for AWS IAM Identity Center.
# • AWS License Manager — If you are planning to use a centralized model to buy and share
# licenses across your organization, we recommend you specify one of your Shared Services
# accounts as the delegated administrator for AWS License Manager.
# • SSH or RDP Bastions for your environment — You can use the Shared VPC in one of your
# Shared Services accounts to deploy a Secure Shell Protocol (SSH) or virtual private network
# (VPN)-tunneled Remote Desktop Protocol (RDP) bastion which will serve as the entry point to
# your AWS Cloud environment.


# The recommended Security OU and accounts, Infrastructure OU and accounts, Workloads OU, and
# Deployments OU are top-level OUs that contain workloads


# Security_Prod > security-tooling-prod
# Core -> Audit,  Log archive
# Infrastructure > Network (vpc and route53, route 53 resolver endpoints), shared_infra

# Transitional, Exceptions, Business Users, Suspended

# TEams?



# billing per hour
