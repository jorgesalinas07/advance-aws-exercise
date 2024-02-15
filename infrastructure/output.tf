output "func_role" {
  value = data.archive_file.lambda.output_path
}

output "aws_api_gateway_rest_api_id" {
  value = module.backend_api.aws_api_gateway_rest_api_id
}

output "aws_api_gateway_resource_id" {
  value = module.backend_api.aws_api_gateway_resource_id
}
