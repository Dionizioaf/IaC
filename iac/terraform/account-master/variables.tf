
variable "default_tags" {
  description = "value for default tags that will be applied in every resource"
  type        = map(any)
  default     = {}
}

variable "ops_profile" {
  description = "value for the profile that will be used to use the ops account"
  type        = string
  default     = "sso-ops"
}

variable "organization_services" {
  description = "value for the service that will be used to create the organization \n Options: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html"
  type        = list(string)
  default     = []
}

variable "organization_policy_types" {
  description = "value for the policy types that will be used to create the organization. \n Options: https://docs.aws.amazon.com/organizations/latest/APIReference/API_EnablePolicyType.html"
  type        = list(string)
  default     = []
}

variable "organization_member_accounts" {
  description = "value for the member accounts that will be created in the organization. \n If delete_on_termination is set to true, the member accounts will be deleted, if set to false, the member accounts will be remove from organization, but not deleted."
  type = list(object({
    name                  = string
    email                 = string
    delete_on_termination = bool
    enable_billing_panel  = bool
  }))
  default = []
}
