variable "aws_region" {
  type = "string"
}

variable "environment" {
  description = "Name of the environment (e.g. digilabs-projextX-dev); will be prefixed to all resources"
  type        = "string"
}

variable "vpc_id" {
  type        = "string"
  description = "The VPC to launch the instance in (e.g. vpc-66ecaa02)"
}

variable "subnet_id" {
  description = "ID of the subnet in which the instance should be launched (e.g. subnet-947982be)"
  type        = "string"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = "string"
  default     = "t2.micro"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized."
  default     = "false"
}

variable "admin_cidr" {
  description = "CIDR pattern to access the bastion host"
  type        = "string"
  default     = "0.0.0.0/0"
}

# list with amazon linux optimized images per region
# last updated on: 2017-06-25 https://aws.amazon.com/amazon-linux-ami/
variable "amazon_optimized_amis" {
  type = "map"

  default = {
    us-east-1      = "ami-a4c7edb2" # N. Virginia
    us-east-2      = "ami-8a7859ef" # Ohio
    us-west-1      = "ami-327f5352" # N. California
    us-west-2      = "ami-6df1e514" # Oregon
    eu-west-1      = "ami-d7b9a2b1" # Ireland
    eu-west-2      = "ami-ed100689" # London
    eu-central-1   = "ami-82be18ed" # Frankfurt
    ap-northeast-1 = "ami-3bd3c45c" # Tokyo
    ap-northeast-2 = "ami-e21cc38c" # Seoel
    ap-southeast-1 = "ami-77af2014" # Singapore
    ap-southeast-2 = "ami-10918173" # Sydney
    ap-south-1     = "ami-47205e28" # Mumbai
    ca-central-1   = "ami-a7aa15c3" # Canada
  }
}

variable "ssh_key_file_pub" {}

variable "enable_bastion" {
  default = false
}
