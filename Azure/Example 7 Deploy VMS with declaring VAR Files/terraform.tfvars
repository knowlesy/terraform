#Variable conditions 
variable "webservertype" {
 type        = map(string)
 description = "Compute Resources"
 default     = {
 
 small = "Standard_B2ms"
 medium = "Standard_B4ms"
 

 }
 
}

variable "tags" {
 type = object({
   environment = string
   locked  = string
 })
 }

 variable "location" {
  type     = string
  nullable = false
}

 variable "name" {
  type     = string
  nullable = false
}


 variable "webserverqty" {
 type        = string
 description = "QTY of VMs"
 default     = "2"


 
 validation {
   condition     = var.webserverqty < 3
   error_message = "Please provide a number less than 3."
 }
}
