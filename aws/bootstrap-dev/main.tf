locals {
  env = "dev"
}

resource "aws_s3_bucket" "tfstate" {
    bucket = "ss33-${local.env}-tfstate"
    tags = {
      env = local.env
      ManagedBy = "terraform"
    }
}

resource "aws_s3_bucket_public_access_block" "block" {
    bucket = aws_s3_bucket.tfstate.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
  
}
