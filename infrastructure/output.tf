output "func_role" {
  value = data.archive_file.lambda.output_path
}

output "aws_api_gateway_rest_api_id" {
  value = module.backend_api.aws_api_gateway_rest_api_id
}

output "aws_api_gateway_resource_id" {
  value = module.backend_api.aws_api_gateway_resource_id
}

output s3_bucket_website_url {
  value = module.frontend_app.s3_bucket_website_url
}

output s3_bucket_uri {
  value = module.frontend_app.s3_bucket_uri
}
