output "cluster_identifier" {
  value = aws_rds_cluster.aurora_cluster.cluster_identifier
}

output "endpoint" {
  value = aws_rds_cluster.aurora_cluster.endpoint
}
