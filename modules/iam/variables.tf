variable "role_name" {
  description = "role name"
  type        = string
  default = "terraform_aws_lambda_role"
}

variable "policy_name" {
  description = "policy name"
  type        = string
  default ="aws_iam_policy_for_terraform_aws_lambda_role"
}