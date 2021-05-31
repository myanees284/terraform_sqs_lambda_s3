locals {
  lambda_zip_location = "outputs/${var.lambdaCodeFile}.zip"
  lambda_function_name=replace("${var.lambdaCodeFile}", "/\\..*/", "")
}