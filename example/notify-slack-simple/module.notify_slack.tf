
module "notify_slack" {
  source = "../../"

  sns_topic_name    = "codecommit_sap-proxy-layer"
  slack_webhook_url = var.slack_webhook_url
  slack_channel     = "aws-notification"
  slack_username    = "wilbur"
}
