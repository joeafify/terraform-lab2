variable "cidr" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
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


variable "region" {
  type = string
}

variable "server" {
  type = string
}

