variable "vpc_id" {
  type = "string"
}

variable "subnets" {
  type = "list"
}

variable "ecs_service_role_name" {
  type = "string"
}

variable "cluster_id" {
  type = "string"
}

variable "aws_region" {
  description = "The AWS region to create things in."
}

variable "environment" {
  description = "Name of the environment (e.g. cheetah-dev); will be prefixed to all resources"
  type        = "string"
}

variable "service_name" {
  type = "string"
}

variable "alb_port" {
  default = "80"
}

variable "alb_protocol" {
  default = "HTTP"
}

variable "container_port" {}

variable "container_cpu" {
  default = ""
}

variable "container_memory" {
  default = ""
}

variable "container_memory_reservation" {
  default = ""
}

variable "image_url" {}

variable "container_environment_vars" {
  type    = "string"
  default = ""
}

variable "desired_count" {
  default = "1"
}
