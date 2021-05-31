resource "aws_lambda_function" "lambda" {
  filename      = local.lambda_zip_location
  function_name = local.lambda_function_name
  role          = var.iamRoleArn
  handler       = "${local.lambda_function_name}.lambda_handler"
  source_code_hash = filebase64sha256("${local.lambda_zip_location}")
  runtime = "python3.8"
}

resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  batch_size        = 1
  event_source_arn  = var.event_source_arn
  enabled           = true
  function_name     = aws_lambda_function.lambda.arn
}