
output "aws_iam_role_role_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_iam_role.lambda_role.arn
}