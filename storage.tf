resource "aws_s3_bucket" "topskys" {
  bucket = "topskys"
  tags = {
    Name = "topskys"
  }
}

resource "aws_s3_bucket" "main" {
  bucket = "my-s3-bucket"
  tags = {
    Name = "my-s3-bucket"
  }
}
