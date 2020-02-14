variable "create" {
  description = "Whether to create all resources"
  default     = true
}

variable "create_sns_topic" {
  description = "Whether to create new SNS topic"
  default     = true
}

variable "create_with_kms_key" {
  type        = string
  description = "Whether to create resources with KMS encryption"
  default     = false
}

variable "lambda_function_name" {
  description = "The name of the Lambda function to create"
  default     = "notify_slack"
  type        = string
}

variable "sns_topic_name" {
  description = "The name of the SNS topic to create"
  type        = string
}

variable "slack_webhook_url" {
  description = "The URL of Slack webhook"
  type        = string
}

variable "slack_channel" {
  description = "The name of the channel in Slack for notifications"
  type        = string
}

variable "slack_username" {
  description = "The username that will appear on Slack messages"
  type        = string
}

variable "slack_emoji" {
  description = "A custom emoji that will appear on Slack messages"
  default     = ":aws:"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used for decrypting slack webhook url"
  default     = ""
  type        = string
}



