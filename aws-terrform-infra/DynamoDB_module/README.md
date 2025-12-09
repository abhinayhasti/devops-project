# DynamoDB Module

This Terraform module creates an Amazon DynamoDB table with provisioned capacity.

## Features

- **DynamoDB Table**: NoSQL database table
- **Provisioned Capacity**: 5 RCU and 5 WCU
- **Hash Key**: Primary key configuration

## Resources Created

1. `aws_dynamodb_table` - DynamoDB table named "whiz-table"

## Configuration

- **Table Name**: whiz-table
- **Billing Mode**: PROVISIONED
- **Read Capacity**: 5 units
- **Write Capacity**: 5 units
- **Primary Key**: RollNo. (Number type)

## Usage

```bash
terraform init
terraform apply
```

## Use Cases

- NoSQL database applications
- User data storage
- Session management
- IoT data collection

## Cleanup

```bash
terraform destroy
```
