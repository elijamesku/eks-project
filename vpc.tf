resource "aws_vpc" "three_tier_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "three-tier-vpc"
    Environment = "production"
  }
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1a"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.three_tier_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-1b"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet-1a"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet-1b"
  }
}

resource "aws_subnet" "db_subnet_1a" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "db-subnet-1a"
  }
}

resource "aws_subnet" "db_subnet_1b" {
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "db-subnet-1b"
  }
}

resource "aws_internet_gateway" "three_tier_igw" {
  vpc_id = aws_vpc.three_tier_vpc.id
  tags = {
    Name = "three-tier-igw"
  }
}
