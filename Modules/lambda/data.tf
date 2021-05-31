data "archive_file" "Read_SQS_Write_S3" {
  type        = "zip"
  source_file = "./lambdacode/${var.lambdaCodeFile}"
  output_path = local.lambda_zip_location
}