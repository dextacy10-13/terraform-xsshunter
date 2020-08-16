resource "aws_security_group" "xsshunter" {
  name        = "allow-jenkins"
  vpc_id      = aws_vpc.cicd.id
  description = "ManagedByTerraform"
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.xsshunter.id
  to_port           = 22
  cidr_blocks       = [var.access_cidr, cidrsubnet(aws_vpc.cicd.cidr_block, 3, 1)]
  description       = "ManagedByTerraform"
}

resource "aws_security_group_rule" "egress" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.xsshunter.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "ManagedByTerraform"
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.xsshunter.id
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "ManagedByTerraform"
}

resource "aws_security_group_rule" "https" {
  type              = "ingress"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.xsshunter.id
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "ManagedByTerraform"
}