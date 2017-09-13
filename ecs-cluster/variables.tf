variable "aws_region" {
  description = "The AWS region to create things in."
}

variable "key_name" {
  description = "Name of AWS key pair"
}

variable "instance_type" {
  default     = "t2.small"
  description = "AWS instance type"
}

variable "asg_min" {
  description = "Min numbers of servers in ASG"
  default     = "1"
}

variable "asg_max" {
  description = "Max numbers of servers in ASG"
  default     = "2"
}

variable "asg_desired" {
  description = "Desired numbers of servers in ASG"
  default     = "1"
}

// new
variable "vpc_id" {
  type = "string"
}

variable "vpc_cidr" {
  type = "string"
}

variable "environment" {
  description = "Name of the environment (e.g. cheetah-dev); will be prefixed to all resources"
  type        = "string"
}

variable "subnets" {
  type = "list"
}

// http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI_launch_latest.html
variable "ecs_optimized_amis" {
  description = "List with ecs optimized images per region, last updated on: 2016-04-25"
  type        = "map"

  # last updated on: 2017-08-12 (2017.03.d)
  default = {
    us-east-1      = "ami-04351e12" # N. Virginia
    us-east-2      = "ami-207b5a45"
    us-west-1      = "ami-7d664a1d" # N. California
    us-west-2      = "ami-ff15039b" # Oregon
    eu-west-1      = "ami-809f84e6" # Ireland
    eu-west-2      = "ami-bf9481db"
    eu-central-1   = "ami-a3a006cc" # Frankfurt
    ap-northeast-1 = "ami-e4657283" # Tokyo
    ap-southeast-1 = "ami-19f7787a" # Singapore
    ap-southeast-2 = "ami-42e9f921" # Sydney
    ca-central-1   = "ami-3da81759"
  }
}

variable "os" {
  default = "standard"
}
