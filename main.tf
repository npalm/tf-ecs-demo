provider "aws" {
  region  = "${var.aws_region}"
  version = "0.1.4"
}

module "vpc" {
  source = "git::https://github.com/npalm/tf-aws-vpc.git?ref=1.2.0"

  aws_region  = "${var.aws_region}"
  environment = "${var.environment}"
}
