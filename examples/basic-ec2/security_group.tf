resource "aws_security_group" "bastion-sg" {
  name   = "bastion-security-group of ${var.project}"
  description = "Allow SSH access to bastion host and outbound internet access"
  vpc_id = aws_default_vpc.default.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Project = var.project
  }
}


resource "aws_security_group_rule" "ssh" {
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion-sg.id
}

resource "aws_security_group_rule" "internet" {
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion-sg.id
}
