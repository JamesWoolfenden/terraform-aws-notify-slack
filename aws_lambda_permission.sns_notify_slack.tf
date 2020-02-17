resource "aws_lambda_permission" "sns_notify_slack" {
  count = var.create

  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.notify_slack.0.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = local.sns_topic_arn
}
