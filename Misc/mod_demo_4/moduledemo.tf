provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "test"
  cidr = "192.168.1.0/24"

  azs             = ["1"]
  private_subnets = ["192.168.1.0/24"]
  public_subnets  = ["0.0.0.0/24"]

 


}