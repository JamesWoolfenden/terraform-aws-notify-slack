resource "aws_iam_role_policy" "lambda" {
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  count = var.create

  name_prefix = "lambda-policy-"
  role        = aws_iam_role.lambda.0.id

  policy = element(compact(concat(data.aws_iam_policy_document.lambda.*.json, data.aws_iam_policy_document.lambda_basic.*.json)), 0)
}
