provider "aws" {
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

locals {
  tag = {
    country = "UK"
    region  = "NE"
  }
}
resource "aws_instance" "example" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  tags          = local.tag
}
