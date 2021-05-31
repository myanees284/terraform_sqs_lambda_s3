# terraform_sqs_lambda_s3<br>

This terraform code creates:<br>
1) IAM role<br>
2) lambda function with python code.<br>
3) SQS queue<br>
4) S3 bucket<br><br>

When the message is sent through the queue, the lambda function reads the queue,extracts the message and dumps the data into S3 as json.<br><br>
*****command to run*****<br><br>
terraform apply -auto-approve -var-file="inputs.tfvars" </br>
terraform destroy -auto-approve -var-file="inputs.tfvars"
