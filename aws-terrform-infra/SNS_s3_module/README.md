# SNS with S3 Module

This Terraform module creates an SNS topic with S3 event notifications.

## Features

- **SNS Topic**: Pub/Sub messaging topic
- **S3 Integration**: S3 bucket events trigger SNS notifications
- **Event Notifications**: Get notified on S3 object operations

## Resources Created

1. `aws_sns_topic` - SNS topic
2. `aws_s3_bucket` - S3 bucket
3. `aws_s3_bucket_notification` - S3 event notification configuration
4. `aws_sns_topic_policy` - Allows S3 to publish to SNS

## Event Types

Common S3 events that can trigger notifications:
- Object creation (PUT, POST, COPY)
- Object deletion
- Object restoration

## Usage

```bash
terraform init
terraform apply
```

Subscribe to the SNS topic to receive S3 event notifications.

## Use Cases

- File upload monitoring
- Data pipeline triggers
- Audit logging
- Real-time processing workflows

## Cleanup

```bash
terraform destroy
```
