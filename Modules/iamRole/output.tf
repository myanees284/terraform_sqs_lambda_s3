output "iamPolicyArns"{
    value=aws_iam_policy.iamPolicy.arn
}

output "iamRoleArn"{
    value=aws_iam_role.myIamRole.arn
}