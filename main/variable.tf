variable "project" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "db_name" {
    description = "database name"
    type        = string
}

variable "db_username" {
    description = "database username"
    type        = string
}

variable "instance_class" {
    description = "class of the instance"
    type        = string
}

variable "ami_id" {
    description = "ami instance id"
    type        = string
}

variable "instance_type" {
    description = "type of the instance"
    type        = string
}

variable "key_name" {
    description = "key name of the instance"
    type = string
}