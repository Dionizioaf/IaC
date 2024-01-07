# Account Network


Just some notes we collect while reading some documentation and we need to decide if implement or not


# Network account
# The networking account serves as the central hub for your network on AWS. You can manage your
# networking resources and route traffic between accounts in your environment, your on-premises,
# and egress/ingress traffic to the internet. Within this account, your networking administrators can
# manage and build security measures to protect outbound and inbound traffic on your environment
# centralizing AWS Site-to-Site VPN connections, AWS Direct Connect integrations, AWS Transit
# Gateway configurations, DNS services, Amazon VPC endpoints, and shared VPCs and subnets.
# More advanced use cases include the use of an ingress/egress or perimeter security account to
# host network security stacks which provide centralized inbound and outbound internet traffic
# inspection, proxying, and filtering

# Amazon VPC — If you plan to implement centralized networking in your AWS environment, we
# recommend managing your VPCs within your networking account, and sharing resources across
# your accounts within your AWS organization.
# • AWS Transit Gateway — If you centralize networking, create a transit gateway resource in the
# networking account and share it across the accounts within your AWS organization.
# • Amazon Route 53 — If you plan to use Amazon Route 53 in your organization, we recommend
# deploying Route 53 in one of your shared services accounts and share private zones and resolver
# routes with the accounts in your AWS organization.
# • AWS Firewall Manager — If you intend to use AWS Firewall Manager across your AWS
# organization, we recommend that you specify one of your security tooling accounts as the
# delegated administrator for Firewall Manager.
# • AWS Network Firewall — If you centralize your networking, using AWS Network Firewall can
# help you protect your inbound and outbound traffc in your Networking account.