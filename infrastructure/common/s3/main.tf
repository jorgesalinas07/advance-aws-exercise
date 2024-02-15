resource aws_s3_bucket frontent_app_bucket {
  bucket = var.bucket_name
}


resource aws_s3_bucket_public_access_block frontent_app_bucket_public_access_block {
  bucket                  = aws_s3_bucket.frontent_app_bucket.id
  ignore_public_acls      = false
  block_public_acls       = false
  restrict_public_buckets = false
  block_public_policy     = false
}

resource aws_s3_bucket_website_configuration frontent_app_bucket_website_configuration {
  bucket = aws_s3_bucket.frontent_app_bucket.id

  index_document {
    suffix = "index.html"
  }

  routing_rule {
    redirect {
      replace_key_with = "index.html"
    }
  }
}


resource aws_s3_object frontent_app_bucket_assets {

  bucket = aws_s3_bucket.frontent_app_bucket.id
  key    = "index.html"
  source = var.source_path
  etag = "index"

  content_type = "text/html; charset=UTF-8"
}

data aws_iam_policy_document frontent_app_bucket_access_policy {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.frontent_app_bucket.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource aws_s3_bucket_policy frontent_app_bucket_access {
  bucket = aws_s3_bucket.frontent_app_bucket.id
  policy = data.aws_iam_policy_document.frontent_app_bucket_access_policy.json
}
