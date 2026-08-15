terraform {
  backend "s3" {
    bucket       = "my-company-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}