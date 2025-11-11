resource "aws_s3_bucket" "tahoe" {
  bucket = "tahoe"
  tags = {
    Name = "tahoe"
  }
}

resource "aws_s3_bucket" "t" {
  bucket = "t"
  tags = {
    Name = "t"
  }
}

resource "aws_s3_bucket" "foo" {
  bucket = "foo"
  tags = {
    Name = "foo"
  }
}

resource "aws_s3_bucket" "yun" {
  bucket = "yun"
  tags = {
    Name = "yun"
  }
}

resource "aws_s3_bucket" "hay" {
  bucket = "hay"
  tags = {
    Name = "hay"
  }
}

resource "aws_s3_bucket" "age" {
  bucket = "age"
  tags = {
    Name = "age"
  }
}
