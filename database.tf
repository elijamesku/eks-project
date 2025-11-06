resource "aws_db_subnet_group" "three_tier_db_subnet_group" {
  name       = "three-tier-db-subnet-group"
  subnet_ids = ["${aws_subnet.db_subnet_1a.id}", "${aws_subnet.db_subnet_1b.id}"]
  tags = {
    Name = "three-tier-db-subnet-group"
  }
}

resource "aws_db_instance" "three_tier_rds" {
  identifier             = "three-tier-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  db_name                = "threetierdb"
  username               = "admin"
  password               = "changeme123!"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  db_subnet_group_name   = aws_db_subnet_group.three_tier_db_subnet_group.name
  skip_final_snapshot    = true
  tags = {
    Name = "three-tier-rds"
  }
}
