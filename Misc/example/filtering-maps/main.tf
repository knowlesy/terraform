#https://stackoverflow.com/questions/63463671/how-to-remove-values-from-a-map-in-terraform-that-match-a-key-value
variable "test_map" {

  default = {
    person1 = {
      name = "John"
      type = "Red"
    }
    person2 = {
      name = "James"
      type = "Blue"
    }
    person3 = {
      name = "Jim"
      type = "Red"
    }
    person4 = {
      name = "Jack"
      type = "Blue"
    }
    person5 = {
      name = "Jane"
      type = "Red"
    }
    person6 = {
      name = "Jake"
      type = "Red"
    }
    person7 = {
      name = "Jone"
      type = "Red"
    }
  }
}

variable "exclude" {
  default = "Red"
}

output "test" {
  value = { for k, v in var.test_map : k => v if !contains(values(v), var.exclude) }
}