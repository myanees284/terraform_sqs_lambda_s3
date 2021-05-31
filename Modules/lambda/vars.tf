variable "iamRoleArn" {
  default = "iamRoleARN"
}

variable "lambdaCodeFile" {
  default = "Read_SQS_Write_S3.py"
}

variable "event_source_arn" {
  default = "dummy_arn"
}