provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  shared_credentials_files = [".\\.aws\\credentials"]
  profile                     = "default"
  alias                       = "test1"
}
provider "aws" {
  region                      = "us-east-2"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  shared_credentials_files = [".\\.aws\\credentials"]
  profile                     = "testaccount2"
  alias                       = "test2"
}
resource "aws_instance" "myec2-1" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  provider      = aws.test1
}
resource "aws_instance" "myec2-2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  provider      = aws.test2
}
