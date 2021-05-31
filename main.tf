#provider tells terraform which cloud provider and region to use
provider "aws" {
  region = var.region
}

# this independent module creates an iam role and attaches a policy. Mandatory inputs : iamRoleName - role name and policyNames - policy file name to be placed in /policyfile folder
module "awsRole" {
  source      = "./Modules/iamRole/"
  policyNames = var.policyNames
  iamRoleName = var.iamRoleName
}

resource "aws_sqs_queue" "terraform_queue" {
  name = "terraform-test-queue"
}

# this independent module creates lamda function with py runtime. Mandatory inputs : 
# iamRoleArn - ARN returned from awsRole module
# lambdaCodeFile - python file name which is placed in /lambdacode folder
# event_source_arn - ARN from sqs resource to attach to lambda as trigger
module "awsLambda" {
  source           = "./Modules/lambda/"
  iamRoleArn       = module.awsRole.iamRoleArn
  lambdaCodeFile   = var.lambdaCodeFile
  event_source_arn = aws_sqs_queue.terraform_queue.arn
}

#creating s3 bucket livebucket2021 to save output of lambda i.e Lambda reads the messaage from SQS queue and save it into this bucket in json file
resource "aws_s3_bucket" "bucket" {
  #livebucket2021 is taken. Change it to some other bucket name and add the same name into /lambdacode/single_pi.py at line 25
  bucket        = "livebucket2021"
  acl           = "private"
  # to delete non empty bucket at terraform destroy
  force_destroy = true
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}