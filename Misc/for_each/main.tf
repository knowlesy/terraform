provider "aws" {
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    for_each = {
      "key1" = "t2.micro"
      "key2" = "t2.medium"
    }
    instance_type = each.value
    key_name = each.key
}
