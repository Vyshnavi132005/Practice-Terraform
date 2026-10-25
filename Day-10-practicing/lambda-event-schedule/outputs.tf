
output "lambda_function_name" {
  description = "Lambda function name"
  value       = aws_lambda_function.scheduled_lambda.function_name
}

output "lambda_function_arn" {
  description = "Lambda function ARN"
  value       = aws_lambda_function.scheduled_lambda.arn
}

output "scheduler_name" {
  description = "EventBridge schedule name"
  value       = aws_scheduler_schedule.lambda_schedule.name
}

output "schedule_expression" {
  description = "Schedule frequency"
  value       = aws_scheduler_schedule.lambda_schedule.schedule_expression
}