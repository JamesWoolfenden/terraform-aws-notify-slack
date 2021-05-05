data "archive_file" "notify_slack" {
  count = var.create

  type        = "zip"
  source_file = "${path.module}/functions/index.js"
  output_path = "${path.module}/functions/notify_slack.zip"
}
