resource "aws_db_subnet_group" "this" {
  name       = "${var.project}-db-subnet-group"
  subnet_ids = var.private_subnet_id

  tags = {
    Name = "${var.project}-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier             = "${var.project}-db"
  engine                 = "mysql"  # or "postgres"
  instance_class         = var.instance_class
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password = random_password.db_password.result  # ✅ secure generated password
  skip_final_snapshot    = true
  vpc_security_group_ids = var.db_sg_id
  db_subnet_group_name   = aws_db_subnet_group.this.name

  tags = {
    Name = "${var.project}-db"
  }
}

resource "random_password" "db_password" {
  length  = 16
  special = true
}

resource "aws_secretsmanager_secret" "db_secret" {
  name = "${var.project}-db-secret"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db_password.result
  })
}
