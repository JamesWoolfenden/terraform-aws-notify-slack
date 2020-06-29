resource "aws_sns_topic" "this" {
  count             = var.create_sns_topic
  name              = var.sns_topic_name
  kms_master_key_id = "alias/aws/sns"
}
