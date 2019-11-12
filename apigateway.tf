resource "aws_api_gateway_rest_api" "api_infraestrutura" {
  name = "${var.my_team}-v1"
  body = "${data.template_file.api_infraestrutura_swagger.rendered}"

  endpoint_configuration {
    types = ["PRIVATE"]
  }
  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "execute-api:Invoke",
            "Resource": "arn:aws:execute-api:region:account-id:api-id/*"
        },
        {
            "Effect": "Deny",
            "Principal": "*",
            "Action": "execute-api:Invoke",
            "Resource": "arn:aws:execute-api:region:account-id:api-id/*",
            "Condition": {
                "StringNotEquals": {
                    "aws:SourceVpce": "${aws_vpc_endpoint.api_infraestrutura_vpce.id}"
                }
            }
        }
    ]
  }
EOF
}

data "template_file" api_infraestrutura_swagger {
  template = "${file("openapi.yaml")}"
}

resource "aws_api_gateway_deployment" "api_infraestrutura_deployment" {
  rest_api_id = "${aws_api_gateway_rest_api.api_infraestrutura.id}"
}
resource "aws_api_gateway_stage" "api_infraestrutura_stage" {
  rest_api_id = "${aws_api_gateway_rest_api.api_infraestrutura.id}"
  stage_name = "${var.environment}"
  deployment_id = "${aws_api_gateway_deployment.api_infraestrutura_deployment.id}"

  variables {
    "answer" = "42"
    "bodoka" = "993"
  }

  tags = {
      Name = "${var.my_team}-${var.product}-v1"
      Terraform = "true"
      busness_owner = "${var.my_team}"
      environment  = "${var.environment}"
  }
}
