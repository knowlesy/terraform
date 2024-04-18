terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}


resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.one]

  # Below ingress allows HTTPS  from DEV VPC
  ingress {
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = var.apis
    to_port     = var.apis
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = var.prod_apis
    to_port     = var.prod_apis
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.one.public_ip}/32"]
  }

  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.gw]
}

resource "aws_network_interface" "multi-ip" {
  subnet_id   = aws_subnet.main.id
  private_ips = ["10.0.0.10"]
}

resource "aws_eip" "one" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "10.0.0.10"
}
