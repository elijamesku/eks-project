resource "aws_s3_bucket" "main_bucket" {
  bucket = "main-bucket"
  tags = {
    Name        = "main-bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "main_bucket_versioning" {
  bucket = aws_s3_bucket.main_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
