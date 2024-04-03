resource "aws_instance" "myec2-2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  key_name      = "deployer-key"

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
    on_failure = continue
  }
}