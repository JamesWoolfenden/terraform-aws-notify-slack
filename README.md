# AWS Notify Slack Terraform module

This module creates SNS topic (or use existing one) and a AWS Lambda function which sends notifications to Slack using [incoming webhooks API](https://api.slack.com/incoming-webhooks).

Start by setting up an [incoming webhook integration](https://my.slack.com/services/new/incoming-webhook/) in your Slack workspace.

## Features

- [x] AWS Lambda runtime Python 3.6
- [x] Create new SNS topic or use existing one
- [x] Support plaintext and encrypted version of Slack webhook URL
- [x] Most of Slack message options are customizable
- [x] Support different types of SNS messages:
  - [x] AWS Cloudwatch
  - [ ] [Send pull-request to add support of other message types](https://github.com/terraform-aws-modules/terraform-aws-notify-slack/pulls)

## Usage

```hcl
module "notify_slack" {
  source = "terraform-aws-modules/notify-slack/aws"

  sns_topic_name = "slack-topic"

  slack_webhook_url = "https://hooks.slack.com/services/AAA/BBB/CCC"
  slack_channel     = "aws-notification"
  slack_username    = "reporter"
}
```

## Use existing SNS topic or create new

If you want to subscribe AWS Lambda Function created by this module to an existing SNS topic you should specify `create_sns_topic = false` as argument and specify name of existing SNS topic name in `sns_topic_name`.

## Examples


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| archive | n/a |
| aws | n/a |
| null | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [archive_file](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) |
| [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) |
| [aws_lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) |
| [aws_lambda_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) |
| [aws_sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/sns_topic) |
| [aws_sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) |
| [aws_sns_topic_subscription](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) |
| [null_data_source](https://registry.terraform.io/providers/hashicorp/null/latest/docs/data-sources/data_source) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create | Whether to create all resources | `bool` | `true` | no |
| create\_sns\_topic | Whether to create new SNS topic | `bool` | `true` | no |
| create\_with\_kms\_key | Whether to create resources with KMS encryption | `string` | `false` | no |
| kms\_key\_arn | ARN of the KMS key used for decrypting slack webhook url | `string` | `""` | no |
| lambda\_function\_name | The name of the Lambda function to create | `string` | `"notify_slack"` | no |
| slack\_channel | The name of the channel in Slack for notifications | `string` | n/a | yes |
| slack\_emoji | A custom emoji that will appear on Slack messages | `string` | `":aws:"` | no |
| slack\_username | The username that will appear on Slack messages | `string` | n/a | yes |
| slack\_webhook\_url | The URL of Slack webhook | `string` | n/a | yes |
| sns\_topic\_name | The name of the SNS topic to create | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_iam\_role\_arn | The ARN of the IAM role used by Lambda function |
| lambda\_iam\_role\_name | The name of the IAM role used by Lambda function |
| notify\_slack\_lambda\_function\_arn | The ARN of the Lambda function |
| notify\_slack\_lambda\_function\_invoke\_arn | The ARN to be used for invoking Lambda function from API Gateway |
| notify\_slack\_lambda\_function\_last\_modified | The date Lambda function was last modified |
| notify\_slack\_lambda\_function\_name | The name of the Lambda function |
| notify\_slack\_lambda\_function\_version | Latest published version of your Lambda function |
| this\_slack\_topic\_arn | The ARN of the SNS topic from which messages will be sent to Slack |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
