locals {
  engine = "aurora-mysql"
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier = var.cluster_identifier

  engine      = local.engine
  engine_mode = "provisioned"

  master_username             = "admin"
  manage_master_user_password = true

  vpc_security_group_ids = var.security_group_ids

  db_subnet_group_name = aws_db_subnet_group.private.name

  network_type = "IPV4"
  port         = 3306

  skip_final_snapshot          = true
  delete_automated_backups     = false
  performance_insights_enabled = false

  storage_encrypted = false

  tags = {
    Name = "${var.resource_name_prefix}AuroraCluster"
  }
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  identifier         = "${var.cluster_identifier}-instance"
  cluster_identifier = var.cluster_identifier

  engine = local.engine

  instance_class = "db.t3.medium"

  db_subnet_group_name = aws_db_subnet_group.private.name

  performance_insights_enabled = false

  tags = {
    Name = "${var.resource_name_prefix}AuroraInstance"
  }
}


resource "aws_db_subnet_group" "private" {
  name        = var.cluster_identifier
  description = "Created from the Terraform"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.resource_name_prefix}PrivateSubnetGroup"
  }
}

