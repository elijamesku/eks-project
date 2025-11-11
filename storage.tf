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

resource "aws_s3_bucket" "desktop" {
  bucket = "desktop"
  tags = {
    Name = "desktop"
  }
}

resource "aws_s3_bucket" "rallo" {
  bucket = "rallo"
  tags = {
    Name = "rallo"
  }
}

resource "aws_s3_bucket" "gatey" {
  bucket = "gatey"
  tags = {
    Name = "gatey"
  }
}

resource "aws_s3_bucket" "utf" {
  bucket = "utf"
  tags = {
    Name = "utf"
  }
}

resource "aws_s3_bucket" "agenta" {
  bucket = "agenta"
  tags = {
    Name = "agenta"
  }
}
