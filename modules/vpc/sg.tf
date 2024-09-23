resource "aws_security_group" "cluster_shared_node" {
  name        = "${var.resource_name_prefix}ClusterSharedNode"
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
    Name = "${var.resource_name_prefix}WorkerNode"
  }
}
