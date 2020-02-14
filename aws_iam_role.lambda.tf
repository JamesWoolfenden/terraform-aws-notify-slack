
resource "aws_iam_role" "lambda" {
  count = var.create

  name_prefix        = "lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.0.json
}