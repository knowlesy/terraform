#https://stackoverflow.com/questions/65956626/terraform-filter-list-of-maps-based-on-key
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

locals {
  filter_map = { for i, colour in var.test_map : tostring(i) => colour }
  specific_keys = compact([for i, colour in local.filter_map : colour.type != "Red" ? i : ""])
  new_map     = [for key in local.specific_keys : lookup(local.filter_map, key)]
}

output "test" {
  value = local.new_map
}