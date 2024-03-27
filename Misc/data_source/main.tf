provider "aws" {
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "ami"{
    most_recent = true
    owners = ["amazon"]

    filter{
        name = "name"
        values = ["amz2-ami-hvm*"]
    }
}
resource "aws_instance" "example" {
  ami           = data.aws_ami.ami
  instance_type = "t2.micro"
}
