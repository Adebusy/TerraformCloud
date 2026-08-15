resource "aws_iam_role" "lambda_role" {
 
  name = var.role_name //"terraform_aws_lammbda_role" 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"//"ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*", "logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents", "lambda:*"]
    resources = ["*"]
  }
}


resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = var.policy_name //"aws_iam_policy_for_terraform_aws_lambda_role"
  description = "aws iam policy for terraform aws lambda role"
  policy      = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}