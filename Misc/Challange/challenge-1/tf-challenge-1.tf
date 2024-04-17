provider "aws" {
  version = "~> 2.54"
  region  = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}

provider "digitalocean" {}

terraform {
    required_version = "0.12.31"
}


resource "aws_eip" "kplabs_app_ip" {
  vpc      = true
}
