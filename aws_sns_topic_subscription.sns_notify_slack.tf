resource "aws_sns_topic_subscription" "sns_notify_slack" {
  count = var.create

  topic_arn = local.sns_topic_arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.notify_slack.0.arn
}
