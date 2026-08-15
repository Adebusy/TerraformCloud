variable "filename" {
  description = "filename"
  type        = string
}

variable "function_name" {
  description = "function name"
  type        = string
}

variable "role_name" {
  description = "role"
  type        = string
}

variable "handler" {
  description = "handler function"
  type        = string
}

variable "runtime" {
  description = "code runtime"
  type        = string
}

variable "tags" {
  description = "CIDRs for public subnets"
  type        = map(string)
  default = {
    "Environment" = "production"
    "Application" = "example"
  }
}

variable "code_sha256" {
  description = "code_sha"
  type        = string
  default = "data.archive_file.example.output_base64sha256"
}
