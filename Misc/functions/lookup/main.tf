provider "aws" {
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

variable "region"{
    type = string
    default = "us-east-1"
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-005e54dee72cc1d00"
    "us-east-2" = "ami-005e54dee72cc1d01"
    "us-east-3" = "ami-005e54dee72cc1d02"
  }
}
resource "aws_instance" "example" {
  ami           = lookup(var.ami,var.region)
  instance_type = "t2.micro"
}
