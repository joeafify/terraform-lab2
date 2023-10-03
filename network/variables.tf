variable "cidr" {
  type = string
}

variable "subnet_public" {
  type = list(any)
}

variable "az" {
  type = list(any)
}

variable "subnet_private" {
  type = list(any)
}
