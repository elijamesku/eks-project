resource "aws_s3_bucket" "scotty" {
  bucket = "scotty"
  tags = {
    Name = "scotty"
  }
}
