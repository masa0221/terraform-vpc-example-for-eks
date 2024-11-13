resource "aws_security_group" "worker_node" {
  name        = "${var.resource_name_prefix}WorkerNode"
  description = "Identifies EKS nodes used for outbound communication with external services"

  vpc_id = aws_vpc.main.id

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
