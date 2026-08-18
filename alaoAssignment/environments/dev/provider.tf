terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# # Configure the AWS Provider
# provider "aws" {
#   region = "us-east-1"
# }

provider "aws" {
  region = "eu-west-2"
  shared_credentials_files = [
    "../../../credentials"
  ]

  profile = "default"

}