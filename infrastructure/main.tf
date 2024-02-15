data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "/backend"
  output_path = "lambda_function_payload.zip"
}

locals {
  backend_func_name      = "backend_function"
  backend_handler        = "main.lambda_handler"
  backend_runtime        = "python3.7"
  backend_filename       = "lambda_function_payload.zip"
  backend_role_name      = "backend_role"
  backend_api_name       = "backend_api"
  backend_api_stage_name = "backend_api_stage"
}

module "backend_lambda" {
  source      = "./common/lambda"
  func_name   = local.backend_func_name
  handler     = local.backend_handler
  runtime     = local.backend_runtime
  filename    = local.backend_filename
  role_name   = local.backend_role_name
  timeout     = 15
  memory_size = 512
}

module "backend_api" {
  source         = "./common/api-gateway"
  api_gw_name    = local.backend_api_name
  stage_name     = local.backend_api_stage_name
  handler_lambda = module.backend_lambda.function
}
