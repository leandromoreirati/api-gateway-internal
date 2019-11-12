resource "aws_vpc_endpoint" "api_infraestrutura_vpce" {
  vpc_id = "${var.vpc_id}"
  service_name      = "com.amazonaws.${var.region}.execute-api"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    "${aws_security_group.sg-api-gateway-https.id}",
  ]

  private_dns_enabled = true
  subnet_ids = "${var.private_subnets}"

  policy = <<EOF
  {
    "Id": "Policy1573337466578",
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1573337459335",
        "Action": "*",
        "Effect": "Allow",
        "Resource": "*",
        "Principal": "*"
      }
    ]
  }
EOF

  tags = {
      Name = "${var.my_team}-${var.product}"
      Terraform = "true"
      busness_owner = "${var.my_team}"
      environment  = "${var.environment}"
  }

}