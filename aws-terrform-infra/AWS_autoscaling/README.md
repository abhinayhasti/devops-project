# AWS Auto Scaling with Terraform

This Terraform configuration sets up an AWS Auto Scaling Group with a Launch Template to automatically manage EC2 instances.

## Overview

This project demonstrates AWS Auto Scaling infrastructure as code, creating:
- **Launch Template**: Defines the EC2 instance configuration blueprint
- **Auto Scaling Group**: Automatically manages EC2 instances across multiple availability zones

## Architecture

- **Region**: us-east-1
- **Availability Zones**: us-east-1a, us-east-1b
- **Instance Type**: t2.micro
- **AMI**: ami-02e136e904f3da870 (Amazon Linux 2)
- **Desired Capacity**: 2 instances
- **Min/Max Size**: 2 instances

## Prerequisites

- AWS Account with appropriate permissions
- Terraform installed (v1.0+)
- AWS credentials (access key and secret key)

## Configuration Files

- `main.tf` - Main infrastructure configuration
- `variable.tf` - Variable definitions
- `terraform.tfvars` - Variable values (contains sensitive data - should be in .gitignore)

## Setup Instructions

1. **Configure Variables**
   
   Update `terraform.tfvars` with your AWS credentials:
   ```hcl
   region     = "us-east-1"
   access_key = "your-access-key"
   secret_key = "your-secret-key"
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Preview Changes**
   ```bash
   terraform plan
   ```

4. **Apply Configuration**
   ```bash
   terraform apply
   ```

5. **Destroy Resources** (when done)
   ```bash
   terraform destroy
   ```

## Resources Created

### Launch Template (`whiztemp`)
- Defines the configuration for EC2 instances
- Uses Amazon Linux 2 AMI
- Configured with t2.micro instance type
- Named with prefix "whizLT"

### Auto Scaling Group (`whizgroup`)
- Name: whiz-ASG1
- Maintains exactly 2 instances at all times
- Distributes instances across 2 availability zones for high availability
- Automatically replaces unhealthy instances

## Why Launch Templates?

Launch templates provide:
- **Reusability**: Single template for consistent instance configuration
- **Versioning**: Support for multiple template versions
- **Modern Features**: Access to latest AWS features (spot instances, mixed instance types)
- **Auto Scaling Integration**: Seamless integration with Auto Scaling Groups
- **Best Practice**: Replaces older launch configurations with enhanced capabilities

## Security Note

⚠️ **Important**: Never commit `terraform.tfvars` or any files containing AWS credentials to version control. Add them to `.gitignore`:

```
terraform.tfvars
*.tfvars
.terraform/
terraform.tfstate
terraform.tfstate.backup
```

## Best Practices

Consider implementing:
- Use IAM roles instead of access keys for production
- Enable CloudWatch monitoring
- Configure health checks
- Add scaling policies based on metrics
- Use remote state storage (S3 + DynamoDB)
- Implement proper tagging strategy

## License

This project is for educational/demonstration purposes.
