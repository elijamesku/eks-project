resource "aws_s3_bucket" "jollyr" {
  bucket = "jollyr"
  tags = {
    Name      = "jollyr"
    ManagedBy = "Infrara"
  }
}
