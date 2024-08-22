resource "aws_security_group" "cluster_shared_node" {
  name        = "${local.resouce_name_prefix}ClusterSharedNode"
  description = "Communication between all nodes in the cluster"

  vpc_id = aws_vpc.main.id

  ingress {
    description = "Allow nodes to communicate with each other (all ports)"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.resouce_name_prefix}WorkerNode"
  }
}

resource "aws_security_group" "rds" {
  name        = "${local.resouce_name_prefix}/Rds"
  description = "Allow worker node traffic"

  vpc_id = aws_vpc.main.id

  ingress {
    description     = "MySQL from worker node"
    protocol        = "tcp"
    from_port       = 3306
    to_port         = 3306
    security_groups = [aws_security_group.cluster_shared_node.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.resouce_name_prefix}Rds"
  }
}

