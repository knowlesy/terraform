variable "istest" {}
resource "null_resource" "cluster" {
    count = var.istest == true ? 5 : 1
    # if the var is true THEN the count will be 5 if it is dalse then it will be 1
}
