variable "project" {
  type        = string
}

variable "name" {
  type        = string
  description = "Name suffix (e.g. app or web)"
}

variable "ami_id" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "security_group_ids" {
  type        = list(string)
}

variable "public_ip" {
  type        = bool
  description = "Assign public IP"
}

variable "key_name" {
  type        = string
  description = "SSH key name"
}
