provider "aws" {
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

resource "aws_iam_user" "splat" {
    name = "count.${count.index}"
    count = 20
    path = "/system/"
  
}

output "splat" {
    value = aws_iam_user.splat[*].arn
  
}
