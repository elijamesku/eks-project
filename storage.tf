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

resource "aws_s3_bucket" "yanno" {
  bucket = "yanno"
  tags = {
    Name = "yanno"
  }
}

resource "aws_s3_bucket" "maneee" {
  bucket = "maneee"
  tags = {
    Name = "maneee"
  }
}

resource "aws_s3_bucket" "new" {
  bucket = "new"
  tags = {
    Name = "new"
  }
}

resource "aws_s3_bucket" "kinns" {
  bucket = "kinns"
  tags = {
    Name = "kinns"
  }
}
