# Declaring the region
variable "region" {
  default = "us-west-2"
  type    = string
}

#inline policy file name
variable "policyNames" {
  default = "inlinepolicies"
}

#iam role name
variable "iamRoleName" {
  default = "superRole"
}

#iam assume role
variable "assumeRolePolicyName" {
  default = "assume_role_policy"
  type    = string
}

#iamrole ARN
variable "iamRoleArn" {
  default = "dummyARN"
}

#lambda code file name
variable "lambdaCodeFile" {
  default = "single_pi.py"
}

#SQS queue's ARN
variable "event_source_arn" {
  default = "dummy_arn"
}