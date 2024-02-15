output s3_bucket_website_url {
  value = aws_s3_bucket_website_configuration.frontent_app_bucket_website_configuration.website_domain
}

output s3_bucket_uri {
  value = aws_s3_bucket.frontent_app_bucket.id
}
