provider "aws" {
  region = "eu-west-1"
}

module "notify_slack" {
  source = "../../"

  sns_topic_name    = "codecommit_sap-proxy-layer"
  slack_webhook_url = "https://hooks.slack.com/services/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"
  slack_channel     = "aws-notification"
  slack_username    = "wilbur"
}
