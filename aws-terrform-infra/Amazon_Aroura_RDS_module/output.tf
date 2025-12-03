output "security_group_id" {
  description = "ID of the security group attached to the Aurora cluster"
  value       = aws_security_group.allow_aurora.id
}

output "cluster_writer_endpoint" {
  description = "Cluster writer endpoint (for writes)"
  value       = aws_rds_cluster.aurorards.endpoint
}

output "cluster_reader_endpoint" {
  description = "Cluster reader endpoint (load-balanced reads)"
  value       = aws_rds_cluster.aurorards.reader_endpoint
}

output "db_instance_endpoints" {
  description = "Endpoint(s) for the cluster instances (one per instance)"
  # Use splat to handle single or multiple instances
  value       = aws_rds_cluster_instance.cluster_instances[*].endpoint
}
