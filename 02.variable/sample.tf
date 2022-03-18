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

variable "Demo4" {
  description = "Map variable"
  default = {
    course = "DevOps"
    timing = "6AM"
    is_started = true
  }
}