
module "iam" {
  source = "../../../modules/iam"

  role_name = var.role_name

  policy_name = var.policy_name

}

data "archive_file" "zip_the_source_code" {
    type = "zip"
    source_dir = "../pythoncode/"
    output_path = "../pythoncode/hello_python.zip"
}

module "aws_lambda_function" {
    source = "../../../modules/lamdafunction"
    filename      = data.archive_file.zip_the_source_code.output_path
    function_name = var.function_name
    role_name          = module.iam.aws_iam_role_role_arn 
    handler       = "hello_python.${var.function_name}"
    code_sha256   = data.archive_file.zip_the_source_code.output_base64sha256
    runtime = var.runtime
    tags = var.tags
}
