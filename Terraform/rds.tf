resource "aws_security_group" "rds_sg" {
  name        = "rds-mysql-sg"
  description = "Allow MySQL from private app subnets"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "MySQL from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-mysql-sg"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-private-subnets"
  subnet_ids = aws_subnet.private_db[*].id

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = "three-tier-mysql"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  allocated_storage       = 20

  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password

  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  publicly_accessible     = false
  skip_final_snapshot     = true
  deletion_protection     = false
  multi_az                = false   # can enable later

  tags = {
    Name = "three-tier-rds"
  }
}
