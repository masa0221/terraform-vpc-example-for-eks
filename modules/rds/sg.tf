resource "aws_security_group" "rds" {
  name        = "${var.resource_name_prefix}Rds"
  description = "Allow worker node traffic"

  vpc_id = var.vpc_id

  ingress {
    description     = "MySQL from worker node"
    protocol        = "tcp"
    from_port       = 3306
    to_port         = 3306
    security_groups = var.inbound_security_group_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.resource_name_prefix}Rds"
  }
}

