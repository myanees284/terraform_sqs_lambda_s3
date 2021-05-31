# Default policy to create
variable "policyNames" {
  default = "cloudwatch"
}

variable "iamRoleName" {
  default = "myiamrole"
}
variable "assumeRolePolicyName" {
  default = "assume_role_policy"
  type    = string
}