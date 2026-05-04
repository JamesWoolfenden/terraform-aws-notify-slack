data "aws_iam_policy_document" "lambda" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  count = (var.create_with_kms_key == 1 ? 1 : 0) * var.create

  source_json = data.aws_iam_policy_document.lambda_basic.0.json

  statement {
    sid       = "AllowKMSDecrypt"
    effect    = "Allow"
    actions   = ["kms:Decrypt"]
    resources = [var.kms_key_arn == "" ? "" : var.kms_key_arn]
  }
}
