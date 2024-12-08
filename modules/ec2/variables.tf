variable "vpc_name" {
  type = object({
    id    = string
  })
}

variable "subnet_public1" {
  type = object({
    id    = string
  })
}

variable "subnet_public2" {
  type = object({
    id    = string
  })
}

variable "subnet_private1" {
  type = object({
    id    = string
  })
}

variable "subnet_private2" {
  type = object({
    id    = string
  })
}

variable "subnet_private3" {
  type = object({
    id    = string
  })
}

variable "subnet_private4" {
  type = object({
    id    = string
  })
}

variable "ec2_profile" {
  type = object({
    name    = string
  })
}