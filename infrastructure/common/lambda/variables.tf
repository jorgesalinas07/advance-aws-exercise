variable "timeout" {
  type = number
}

variable "filename" {
  type    = string
  default = ""
}

variable "handler" {
  type    = string
  default = ""
}

variable "runtime" {
  type    = string
  default = ""
}

variable "memory_size" {
  type = number
}

variable "role_name" {
  type = string
}

variable "func_name" {
  type = string
}

variable "permissions" {
  description = "Add aditional permissions to the lambda function"
  default     = []
}

variable "env_variables" {
  default = []
}

variable "source_arn" {
  type    = string
  default = ""
}
