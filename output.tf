# REST API
output "api-id" {
  value = "${aws_api_gateway_rest_api.api_infraestrutura.id}"
}

output "api-execution-arn" {
  value = "${aws_api_gateway_rest_api.api_infraestrutura.execution_arn}"
}

# API DEDPLOYMENT
output "api-deployment-id" {
  value = "${aws_api_gateway_deployment.api_infraestrutura_deployment.rest_api_id}"
}

# API STAGE
output "api-stage-id" {
  value = "${aws_api_gateway_stage.api_infraestrutura_stage.id}"
}

output "api-stage-invoke-url" {
  value = "${aws_api_gateway_stage.api_infraestrutura_stage.invoke_url}"
}

output "api-stage-execution-arn" {
  value = "${aws_api_gateway_stage.api_infraestrutura_stage.execution_arn}"
}
output "api-stage-name" {
  value = "${aws_api_gateway_stage.api_infraestrutura_stage.stage_name}"
}


