resource "aws_s3_bucket" "topskys" {
  bucket = "topskys"
  tags = {
    Name = "topskys"
  }
}
