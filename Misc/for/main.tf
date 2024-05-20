variable "list" {
  default = ["a","b","s",""]
}

output "test" {
  value = [for s in var.list : upper(s) if s != ""]
}