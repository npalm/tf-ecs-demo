provider "aws" {
  region  = "${var.aws_region}"
  version = "0.1.4"
}

module "vpc" {
  source = "git::https://github.com/npalm/tf-aws-vpc.git?ref=1.0.0"

  aws_region  = "${var.aws_region}"
  environment = "${var.environment}"
}

resource "aws_key_pair" "key" {
  key_name   = "${var.key_name}"
  public_key = "${file("${var.ssh_key_file_ecs}")}"
}

// Bastion module
module "bastion" {
  source         = "bastion"
  enable_bastion = "${var.enable_bastion}"

  aws_region       = "${var.aws_region}"
  environment      = "${var.environment}"
  ssh_key_file_pub = "${var.ssh_key_file_bastion}"

  vpc_id    = "${module.vpc.vpc_id}"
  subnet_id = "${element(module.vpc.public_subnets, 0)}"
}

// container cluster (ECS)
module "ecs-cluster" {
  source = "ecs-cluster"

  aws_region  = "${var.aws_region}"
  environment = "${var.environment}"
  key_name    = "${var.key_name}"

  vpc_id   = "${module.vpc.vpc_id}"
  vpc_cidr = "${module.vpc.vpc_cidr}"
  subnets  = "${module.vpc.private_subnets}"

  asg_max     = 3
  asg_desired = 3
}
