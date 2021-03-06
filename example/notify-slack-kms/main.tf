provider "aws" {
  region = "eu-west-1"
}

variable "kms_key_arn" {
  default = "arn:aws:kms:eu-west-1:000014191260:key/66db1c5d-d42b-4e28-8efb-07a9cf607a73"
}

# Encrypt the URL, storing encryption here will show it in logs and in tfstate
# https://www.terraform.io/docs/state/sensitive-data.html
data "aws_kms_ciphertext" "slack_url" {
  plaintext = "https://hooks.slack.com/services/AAA/BBB/CCC"
  key_id    = var.kms_key_arn
}

module "notify_slack" {
  source = "../../"

  sns_topic_name = "slack-topic"

  slack_webhook_url = data.aws_kms_ciphertext.slack_url.ciphertext_blob
  slack_channel     = "aws-notification"
  slack_username    = "reporter"

  # Option 1
  //   kms_key_arn = "${aws_kms_key.this.arn}"


  # Option 2
  //  kms_key_arn = "${data.aws_kms_alias.this.target_key_arn}"

  # Option 3
  kms_key_arn         = var.kms_key_arn
  create_with_kms_key = true
}
