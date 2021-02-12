
locals {
  sns_topic_arn = element(concat(aws_sns_topic.this.*.arn, data.aws_sns_topic.this.*.arn, list("")), 0)
}
