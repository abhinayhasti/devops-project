# S3 from EC2 Module

This Terraform module creates an EC2 instance with IAM role permissions to access S3.

## Features

- **EC2 Instance**: Instance with S3 access via IAM role
- **IAM Role**: Grants S3 permissions to EC2
- **Instance Profile**: Attaches role to instance
- **S3 Access**: No hardcoded credentials needed

## Resources Created

1. `aws_iam_role` - IAM role for EC2
2. `aws_iam_role_policy_attachment` - Attaches S3 policy
3. `aws_iam_instance_profile` - Instance profile
4. `aws_security_group` - Security group
5. `aws_instance` - EC2 instance with IAM role

## Security Best Practice

Uses IAM roles instead of hardcoded access keys for S3 access from EC2.

## Usage

```bash
terraform init
terraform apply
```

SSH into the instance and use AWS CLI to access S3 without credentials:
```bash
aws s3 ls
```

## Use Cases

- Applications needing S3 access
- Data processing pipelines
- Backup systems
- Log aggregation

## Cleanup

```bash
terraform destroy
```
