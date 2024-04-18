
provider "aws" {
  region = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}

data "aws_iam_users" "users" {}

data "aws_called_identity" "current" {}

resource "aws_iam_user" "lb" {
  name = "admin-user-${data.aws_called_identity.current.account_id}"
  path = "/system/"
}

output "user_names" {
  value = data.aws_iam_users.users
}

output "total_users" {
  value = length(data.aws_iam_users.users)
}

