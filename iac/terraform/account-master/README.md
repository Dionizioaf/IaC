# Master Account

Here we are going to implement the terraform to manage the master account. We focused in the Best Practices PDF below.

## AWS Doc

[AWS Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
[Best Practices](https://docs.aws.amazon.com/pdfs/whitepapers/latest/organizing-your-aws-environment/organizing-your-aws-environment.pdf)


## Services Enabled

- Organization
- Organization Units
- Member Accounts


## Structure

```

.
├── README.md
├── **main.tf** -> Generic terraform commands
├── **members-account.tf** -> Create the member accounts
├── **organization.tf** -> Activate and configure organization
├── **ou.tf** -> Create the Organization Units
├── **outputs.tf** -> Export the units
├── **provider.tf** -> Terraform provider
├── **scp.tf** -> service control policies configurations
├── **terraform.tfvars** -> Variables values
└── **variables.tf** -> Variables definitions

```

## References

- https://aws.amazon.com/blogs/mt/aws-organizations-aws-config-and-terraform/
- https://docs.aws.amazon.com/organizations/latest/APIReference/API_EnablePolicyType.html
- https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html