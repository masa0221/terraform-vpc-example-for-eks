output "cluster_identifier" {
  value = aws_rds_cluster.aurora_cluster.cluster_identifier
}

output "endpoint" {
  value = aws_rds_cluster.aurora_cluster.endpoint
}

output "security_group" {
  value = aws_security_group.rds.id
}

