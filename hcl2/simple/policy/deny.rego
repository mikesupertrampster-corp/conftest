package main

deny[msg] {
	rule := input.resource.aws_security_group_rule[name]
	rule.type == "ingress"
	contains(rule.cidr_blocks[_], "0.0.0.0/0")
	msg = sprintf("ASG `%v` defines a fully open ingress", [name])
}
