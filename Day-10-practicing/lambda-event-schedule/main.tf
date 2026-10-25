
# Package the Lambda Python code
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

# IAM role for Lambda
resource "aws_iam_role" "lambda_role" {
  name = "scheduled-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Allow Lambda to create CloudWatch logs
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda function
resource "aws_lambda_function" "scheduled_lambda" {
  function_name = "scheduled-lambda-function"
  role          = aws_iam_role.lambda_role.arn

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  handler = "lambda_function.lambda_handler"
  runtime = "python3.12"

  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs
  ]
}

# IAM role for EventBridge Scheduler
resource "aws_iam_role" "scheduler_role" {
  name = "scheduled-lambda-scheduler-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "scheduler.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Allow Scheduler to invoke Lambda
resource "aws_iam_role_policy" "scheduler_invoke" {
  name = "scheduled-lambda-invoke-policy"
  role = aws_iam_role.scheduler_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = ["lambda:InvokeFunction"]
      Resource = aws_lambda_function.scheduled_lambda.arn
    }]
  })
}

# Run Lambda every 5 minutes
resource "aws_scheduler_schedule" "lambda_schedule" {
  name        = "scheduled-lambda-every-five-minutes"
  description = "Invoke Lambda every five minutes"

  schedule_expression          = "rate(5 minutes)"
  schedule_expression_timezone = "Asia/Kolkata"

  flexible_time_window {
    mode = "OFF"
  }

  target {
    arn      = aws_lambda_function.scheduled_lambda.arn
    role_arn = aws_iam_role.scheduler_role.arn

    input = jsonencode({
      message = "Hello from EventBridge Scheduler!"
    })
  }

  depends_on = [
    aws_iam_role_policy.scheduler_invoke
  ]
}