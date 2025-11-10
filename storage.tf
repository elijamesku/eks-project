resource "aws_s3_bucket" "topskys" {
  bucket = "topskys"
  tags = {
    Name = "topskys"
  }
}

resource "aws_s3_bucket" "vancleee" {
  bucket = "vancleee"
  tags = {
    Name = "vancleee"
  }
}

resource "aws_s3_bucket" "main" {
  bucket = "my-s3-bucket"
  tags = {
    Name = "my-s3-bucket"
  }
}

resource "aws_s3_bucket" "test" {
  bucket = "test"
  tags = {
    Name = "test"
  }
}
