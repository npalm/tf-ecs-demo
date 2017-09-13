resource "aws_key_pair" "key" {
  count      = "${var.enable_bastion ? 1 : 0}"
  key_name   = "${var.environment}-bastion"
  public_key = "${file("${var.ssh_key_file_pub}")}"
}

resource "aws_security_group" "ami" {
  count       = "${var.enable_bastion ? 1 : 0}"
  name_prefix = "${var.environment}-security-group"
  vpc_id      = "${var.vpc_id}"

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22

    cidr_blocks = ["${var.admin_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.environment}-bastion-sg"
    Environment = "${var.environment}"
  }
}

resource "aws_instance" "instance" {
  count = "${var.enable_bastion ? 1 : 0}"

  ami                         = "${lookup(var.amazon_optimized_amis, var.aws_region)}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  ebs_optimized               = "${var.ebs_optimized}"
  subnet_id                   = "${var.subnet_id}"
  vpc_security_group_ids      = ["${aws_security_group.ami.id}"]
  key_name                    = "${aws_key_pair.key.key_name}"
  user_data                   = "${file("${path.module}/template/user_data.sh")}"

  tags {
    Name        = "${var.environment}-bastion"
    Environment = "${var.environment}"
  }
}
