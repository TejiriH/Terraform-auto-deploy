variable "project" {
  description = "Project name used to name resources"
  type        = string
}

variable "private_subnet_id" {
  description = "Project name used to name resources"
  type        = list(string)
}

variable "vpc_id" {
    description = "vpc id from vpc output"
    type        = string
}

variable "db_name" {
    description = "The database name"
    type        = string
}

variable "db_username" {
    description = "The database username"
    type        = string
}

variable "db_sg_id" {
    description = "The database security group id"
    type        = list(string)
}

variable "instance_class" {
    description = "Class of instance"
    type        = string
}