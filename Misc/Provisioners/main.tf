provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"

}

resource "aws_instance" "myec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  key_name      = "deployer-key"
  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("./deployer-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y" , 
      "sudo apt-get upgrade -y"
    ]
  }
}

resource "aws_instance" "myec2-2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  key_name      = "deployer-key"
  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("./deployer-key.pem")
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
    on_failure = continue
  }
}

