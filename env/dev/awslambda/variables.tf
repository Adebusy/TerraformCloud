variable "role_name" {
  description = "Name of the S3 bucket"
  type        = string
  default = "policy_name"
}

variable "policy_name" {
  description = "Deployment environment"
  type        = string
  default = "policy_name"
}


variable "filename" {
  description = "filename"
  type        = string
  default = "hello_python.py"
}

variable "function_name" {
  description = "function name"
  type        = string
  default = "hello_python"
}

variable "runtime" {
  description = "code runtime"
  type        = string
  default = "python3.12"
}

variable "tags" {
  description = "CIDRs for public subnets"
  type        = map(string)
  default = {
        "Environment" = "production"
        "Application" = "example"
  }
}
