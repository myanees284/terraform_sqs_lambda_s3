# Create a role
resource "aws_iam_role" "myIamRole" {
  name               = var.iamRoleName
  assume_role_policy = file("policyfile/${var.assumeRolePolicyName}.json")
}

resource "aws_iam_policy" "iamPolicy" {
  policy = file("policyfile/${var.policyNames}.json")
  name = "${var.policyNames}_policy"
}

# Attach the above created policy into the role
resource "aws_iam_role_policy_attachment" "policy_attach" {
  role  = aws_iam_role.myIamRole.name
  policy_arn = aws_iam_policy.iamPolicy.arn
}