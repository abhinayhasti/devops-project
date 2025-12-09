# RDS Multi-AZ with Read Replica Module

This Terraform module creates an RDS instance with Multi-AZ deployment and read replicas.

## Features

- **Multi-AZ Deployment**: Automatic failover to standby
- **Read Replicas**: Scale read operations
- **Automated Backups**: Daily automated backups
- **High Availability**: 99.95% SLA with Multi-AZ

## Resources Created

1. `aws_db_instance` (primary) - Primary RDS instance with Multi-AZ
2. `aws_db_instance` (read_replica) - Read replica instance(s)
3. `aws_db_subnet_group` - DB subnet group
4. `aws_security_group` - Database security group

## Architecture

```
Primary Instance (Multi-AZ) → Synchronous Replication → Standby (Different AZ)
        ↓
Asynchronous Replication
        ↓
Read Replica(s)
```

## Multi-AZ vs Read Replica

### Multi-AZ
- **Purpose**: High availability and disaster recovery
- **Replication**: Synchronous
- **Failover**: Automatic (1-2 minutes)
- **Accessible**: Standby not accessible for reads

### Read Replica
- **Purpose**: Scale read operations
- **Replication**: Asynchronous
- **Accessible**: Yes, for read queries
- **Promotion**: Can be promoted to standalone

## Usage

```bash
terraform init
terraform apply
```

## Use Cases

- Production databases requiring HA
- Read-heavy applications
- Reporting and analytics (use replicas)
- Disaster recovery

## Cleanup

```bash
terraform destroy
```
