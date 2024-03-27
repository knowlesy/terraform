provider "aws" {
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

resource "aws_iam_user" "users" {
    name = "count.${count.index}"
    count = 5
    path = "/system/"
  
}

output "users" {
    value = aws_iam_user.users[*].arn
}

output "combinedusers" {
  value = zipmap(aws_iam_user.users[*].name, aws_iam_user.users[*].arn)
}
