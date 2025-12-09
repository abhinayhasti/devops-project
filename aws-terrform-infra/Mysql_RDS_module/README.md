# MySQL RDS Module

This Terraform module creates an Amazon RDS MySQL database instance.

## Features

- **RDS MySQL**: Managed MySQL database
- **Multi-AZ**: Optional high availability
- **Security Group**: Database access control
- **Default VPC**: Uses existing default VPC

## Resources Created

1. Data sources for default VPC and subnets
2. `aws_db_subnet_group` - DB subnet group
3. `aws_security_group` - Security group for database
4. `aws_db_instance` - MySQL RDS instance

## Configuration

- **Engine**: MySQL
- **Instance Class**: db.t2.micro (or as configured)
- **Storage**: Configurable
- **Multi-AZ**: Configurable

## Prerequisites

- Default VPC must exist
- Subnets in us-east-1a and us-east-1b

## Usage

```bash
terraform init
terraform apply
```

## Use Cases

- Web application databases
- Data persistence
- Relational data storage
- Development/testing environments

## Cleanup

```bash
terraform destroy
```

**Note**: Ensure backup_retention_period is set if you need backups.
