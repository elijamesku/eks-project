resource "aws_s3_bucket" "scotty" {
  bucket = "scotty"
  tags = {
    Name = "scotty"
  }
}

resource "aws_s3_bucket" "rosie" {
  bucket = "rosie"
  tags = {
    Name = "rosie"
  }
}
