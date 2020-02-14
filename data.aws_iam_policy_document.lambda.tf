


data "aws_iam_policy_document" "lambda" {
  count = "${(var.create_with_kms_key == 1 ? 1 : 0) * var.create}"

  source_json = data.aws_iam_policy_document.lambda_basic.0.json

  statement {
    sid = "AllowKMSDecrypt"
    effect = "Allow"
    actions = ["kms:Decrypt"]
    resources = ["${var.kms_key_arn == "" ? "" : var.kms_key_arn}"]
  }
}


