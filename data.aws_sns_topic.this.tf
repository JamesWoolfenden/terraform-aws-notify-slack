data "aws_sns_topic" "this" {
  count = "${(1 - var.create_sns_topic) * var.create}"

  name = var.sns_topic_name
}
