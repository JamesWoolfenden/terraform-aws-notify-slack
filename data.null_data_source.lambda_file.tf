data "null_data_source" "lambda_file" {
  inputs={
    filename = substr("${path.module}/functions/index.js", length(path.cwd) + 1, -1)
  }
}
