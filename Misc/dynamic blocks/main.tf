provider "aws" {
  region     = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

variable "ports" {
  default = [80,443,1000]
}

resource "aws_security_group" "dynamicDemo" {
  name = "dynamic"
  description = "test"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [ "1.1.1.1/32" ]
    }
    
  }
}
