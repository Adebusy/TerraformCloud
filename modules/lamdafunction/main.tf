resource "aws_lambda_function" "lambda_function" {
  filename      = var.filename
  function_name = var.function_name
  role          = var.role_name
  handler       = var.handler
  code_sha256   = var.code_sha256
  runtime = var.runtime
  tags = var.tags
}

# resource "aws_lambda_function" "lambda_function" {
#   filename      = data.archive_file.example.output_path
#   function_name = "example_lambda_function"
#   role          = aws_iam_role.example.arn
#   handler       = "index.handler"
#   code_sha256   = data.archive_file.example.output_base64sha256
#   runtime = "nodejs24.x"

#   tags = {
#     Environment = "production"
#     Application = "example"
#   }
# }