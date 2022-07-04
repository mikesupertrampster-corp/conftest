package main

deny[msg] {
	table := input.resource.aws_dynamodb_table[name]
	table.billing_mode == "PROVISIONED"
	msg = sprintf("DynamoDB table `%v` defines a PROVISIONED billing mode", [name])
}

deny[msg] {
	kms := input.resource.aws_kms_key[name]
	kms.deletion_window_in_days < 30
	msg = sprintf("KMS `%v` deletion window in days greater than or equal to 30", [name])
}

deny[msg] {
	kms := input.resource.aws_lb_target_group[name]
	kms.health_check.path != "/v1/sys/health?standbyok=true&uninitcode=200&sealedcode=200"
	msg = sprintf("LB `%v` healthcheck not set correctly", [name])
}