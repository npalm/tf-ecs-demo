variable "aws_region" {
  type    = "string"
  default = "eu-west-1"
}

variable "environment" {
  type = "string"
}

variable "key_name" {
  type = "string"
}

variable "ssh_key_file_ecs" {
  default = "generated/id_rsa.pub"
}

variable "ssh_key_file_bastion" {
  default = "generated/id_rsa.pub"
}

variable "enable_bastion" {
  type = "string"
}
