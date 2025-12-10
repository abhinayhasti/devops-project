# EC2 Instance Upgrade/Downgrade with Terraform

This Terraform project demonstrates how to manage EC2 instance types, allowing you to upgrade or downgrade instance sizes.

## Overview

This configuration creates an EC2 instance that can be easily resized by modifying the `instance_type` parameter.

## Prerequisites

- AWS Account with appropriate permissions
- Terraform installed (v1.0+)
- AWS credentials (Access Key & Secret Key)

## Files

- `main.tf` - Main Terraform configuration with EC2 instance resource
- `variable.tf` - Variable definitions for AWS credentials and region
- `README.md` - This file

## Usage

### Initial Setup

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Create a `terraform.tfvars` file** with your AWS credentials:
   ```hcl
   access_key = "your-access-key"
   secret_key = "your-secret-key"
   region     = "us-east-1"
   ```

3. **Deploy the infrastructure:**
   ```bash
   terraform plan
   terraform apply
   ```

### Upgrading/Downgrading EC2 Instance

To change the instance size, modify the `instance_type` in `main.tf`:

**Current configuration:**
```hcl
instance_type = "t2.micro"
```

**Example upgrades:**
- `t2.small` - 1 vCPU, 2 GB RAM
- `t2.medium` - 2 vCPU, 4 GB RAM
- `t2.large` - 2 vCPU, 8 GB RAM

**Example downgrades:**
- `t2.nano` - 1 vCPU, 0.5 GB RAM

After modifying, apply the changes:
```bash
terraform apply
```

## Important Notes

### Downtime Considerations

⚠️ **Changing instance type requires stopping the instance**, which causes downtime:
- The instance will be stopped automatically by Terraform
- Typical downtime: 1-5 minutes
- All active connections will be dropped
- For production systems, use:
  - Load balancers with multiple instances
  - Blue-green deployments
  - Scheduled maintenance windows

### Instance Type Changes

- Instance must be stopped before modification
- Public IP may change (unless using Elastic IP)
- EBS volumes remain intact
- Instance store data is lost (if applicable)
- Ensure compatibility between instance types

## Common Instance Types

| Instance Type | vCPU | Memory | Use Case |
|--------------|------|---------|----------|
| t2.nano | 1 | 0.5 GB | Very light workloads |
| t2.micro | 1 | 1 GB | Low traffic applications |
| t2.small | 1 | 2 GB | Small databases, dev environments |
| t2.medium | 2 | 4 GB | Medium applications |
| t2.large | 2 | 8 GB | Larger applications |

## Cleanup

To destroy all resources:
```bash
terraform destroy
```

## Security Best Practices

⚠️ **Do not commit AWS credentials to version control**
- Use `terraform.tfvars` (add to `.gitignore`)
- Consider using AWS IAM roles instead
- Use environment variables or AWS CLI profiles

## Zero-Downtime Alternatives

For production environments requiring no downtime:

1. **Blue-Green Deployment:**
   - Create new instance with desired size
   - Switch traffic to new instance
   - Terminate old instance

2. **Auto Scaling Group:**
   - Use Launch Templates
   - Update template with new instance type
   - Perform rolling update

3. **Load Balancer Setup:**
   - Multiple instances behind ALB/NLB
   - Update instances one at a time
