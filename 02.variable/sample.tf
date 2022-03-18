variable "demo" {
  type = string
  default = "Hello World"
}

output "Demo_var" {
  value = var.demo
}

variable "demo1" {
  default = 100
  type = number
}

variable "demo2" {
  description = "Demo for Boolean demo"
  default = true
  type = bool
}
output "Demo2" {
  value = var.demo
}

variable "Demo4" {
  description = "Map variable"
  default = {
    course = "DevOps"
    timing = "6AM"
    is_started = true
  }
}
output "Demo4" {
  value = var.demo
}

###Varibale from TFVars
variable "input1" {}
variable "input2" {}

output "input1" {
  value = var.input1
}

output "input2" {
  value = var.input2
}