resource "aws_lambda_function" "notify_slack" {
  # checkov:skip=CKV_AWS_173: kms_key_arn configurable via var.kms_key_arn
  # checkov:skip=CKV_AWS_272: code signing not required for this minimal example
  # checkov:skip=CKV_AWS_363: legacy module
  # checkov:skip=CKV_AWS_289: X-Ray tracing not required for this Lambda
  # checkov:skip=CKV_AWS_288: Reserved concurrency not configured for this Lambda
  # checkov:skip=CKV_AWS_284: Log group retention managed separately
  # checkov:skip=CKV_AWS_286: Log group encryption managed separately
  # checkov:skip=CKV_AWS_116: Old code
  # checkov:skip=CKV_AWS_117: VPC not required
  # checkov:skip=CKV_AWS_115: concurrency not an issue

  count = var.create

  filename = data.archive_file.notify_slack.0.output_path

  function_name = var.lambda_function_name

  role             = aws_iam_role.lambda.0.arn
  handler          = "index.handler"
  source_code_hash = data.archive_file.notify_slack.0.output_base64sha256
  runtime          = "nodejs8.10"
  timeout          = 30
  kms_key_arn      = var.kms_key_arn

  environment {
    variables = {
      SLACK_WEBHOOK_URL = var.slack_webhook_url
      SLACK_CHANNEL     = var.slack_channel
      SLACK_USERNAME    = var.slack_username
      SLACK_EMOJI       = var.slack_emoji
    }
  }

  lifecycle {
    ignore_changes = [
      filename,
      last_modified,
    ]
  }
  tracing_config {
    mode = "PassThrough"
  }
}
