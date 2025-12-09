# Amazon Aurora RDS Module

This Terraform module creates an Amazon Aurora RDS cluster with MySQL compatibility.

## Features

- **Aurora Cluster**: High-performance managed database
- **MySQL Compatible**: Aurora MySQL engine
- **Multi-AZ**: High availability across availability zones
- **Read Replicas**: Scalable read capacity
- **Automatic Backups**: Point-in-time recovery

## Resources Created

1. `aws_rds_cluster` - Aurora DB cluster
2. `aws_rds_cluster_instance` - Aurora DB instances
3. `aws_db_subnet_group` - Subnet group for cluster
4. `aws_security_group` - Security group for database access

## Benefits of Aurora

- **Performance**: Up to 5x faster than standard MySQL
- **Scalability**: Auto-scaling storage up to 128TB
- **High Availability**: 6-way replication across 3 AZs
- **Serverless Option**: Pay-per-second billing

## Usage

```bash
terraform init
terraform apply
```

## Use Cases

- Production databases requiring high performance
- Applications needing high availability
- Read-heavy workloads with read replicas
- Enterprise applications

## Cleanup

```bash
terraform destroy
```

**Note**: Aurora clusters are more expensive than standard RDS but offer better performance and availability.
