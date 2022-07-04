resource "aws_security_group_rule" "all_inbound" {
  type        = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "local_inbound" {
  type        = "ingress"
  cidr_blocks = ["10.0.0.0/16"]
}
