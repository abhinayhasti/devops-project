# S3 Bucket with Lifecycle Policy Module

This Terraform module creates an AWS S3 bucket with automated lifecycle policies for cost optimization and data management.

## Features

- **S3 Bucket Creation**: Creates a uniquely named S3 bucket with random suffix
- **Sample Object Upload**: Uploads a sample file to demonstrate object management
- **Automated Lifecycle Rules**: Implements two lifecycle policies:
  - Transition to One Zone-IA storage after 30 days
  - Transition to Glacier storage after 90 days
  - Automatic expiration/deletion after 120 days

## Resources Created

1. `aws_s3_bucket` - S3 bucket with random name suffix
2. `aws_s3_object` - Sample text file upload
3. `aws_s3_bucket_lifecycle_configuration` - Two lifecycle rules for cost optimization

## Lifecycle Policy Details

### Rule 1: Transition to One Zone-IA
- **Purpose**: Reduce storage costs for infrequently accessed data
- **Timeline**: Objects transition after 30 days
- **Storage Class**: ONEZONE_IA (~50% cheaper than Standard)
- **Expiration**: Objects deleted after 120 days

### Rule 2: Transition to Glacier
- **Purpose**: Archive data for long-term retention
- **Timeline**: Objects transition after 90 days
- **Storage Class**: GLACIER (~80% cheaper than Standard)
- **Expiration**: Objects deleted after 120 days

## Prerequisites

- Terraform >= 0.12
- AWS Account with appropriate permissions
- AWS credentials (Access Key & Secret Key)
- `files/sample.txt` file in the module directory

## Usage

1. Clone or copy this module to your project

2. Create a `terraform.tfvars` file with your AWS credentials:
```hcl
region     = "us-east-1"
access_key = "YOUR_AWS_ACCESS_KEY"
secret_key = "YOUR_AWS_SECRET_KEY"
```

3. Initialize Terraform:
```bash
terraform init
```

4. Review the execution plan:
```bash
terraform plan
```

5. Apply the configuration:
```bash
terraform apply
```

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| region | AWS region | string | yes |
| access_key | Access key to AWS console | string | yes |
| secret_key | Secret key to AWS console | string | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket | The ID/name of the S3 bucket |
| object | The ID of the uploaded object |
| rule_ids | List of lifecycle rule IDs |

## Cost Optimization Benefits

This module demonstrates AWS cost optimization best practices:

- **Day 0-30**: Standard storage (frequent access)
- **Day 30-90**: One Zone-IA (50% cost reduction)
- **Day 90-120**: Glacier (80% cost reduction)
- **Day 120+**: Automatic deletion (prevent indefinite storage costs)

## Security Notes

⚠️ **Important**: Never commit `terraform.tfvars` with real AWS credentials to version control. Use environment variables or AWS credential profiles instead.

Better alternatives:
```bash
# Use environment variables
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
```

Or use AWS CLI profiles:
```hcl
provider "aws" {
  region  = var.region
  profile = "your-profile-name"
}
```

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

Note: The bucket is created with `force_destroy = true`, so it will be deleted even if it contains objects.

## Use Cases

This module is ideal for:
- Log file management
- Temporary data storage
- Backup retention with automatic expiration
- Development/testing environments
- Data with predictable access patterns

## License

This module is provided as-is for educational and demonstration purposes.
