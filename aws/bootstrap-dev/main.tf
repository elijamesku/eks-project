locals {
  env = "dev"
}

# s3 bucket 
resource "aws_s3_bucket" "tfstate" {
  bucket = "ss33-${local.env}-tfstate"
  tags = {
    env       = local.env
    ManagedBy = "terraform"
  }
}

# public access block
resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.tfstate.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

# bucket versioning
resource "aws_s3_bucket_versioning" "v" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

# encryptiion configuration 
resource "aws_s3_bucket_server_side_encryption_configuration" "enc" {
  bucket = aws_s3_bucket.tfstate.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# bucket policy 
resource "aws_s3_bucket_policy" "tls_only" {
  bucket = aws_s3_bucket.tfstate.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "DenyInsecureTransport",
      Effect    = "Deny",
      Principal = "*",
      Action    = "s3:*",
      resource = [
        aws_s3_bucket.tfstate.arn,
        "${aws_s3_bucket.tfstate.arn}/*"
      ],
      Condition = {
        Bool = {
          "aws:SecureTransport" = "false"
        }
      }


    }]
  })

}