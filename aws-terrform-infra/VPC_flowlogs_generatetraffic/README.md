# VPC Flow Logs and Traffic Generation Module

This Terraform module creates a complete AWS infrastructure for demonstrating VPC Flow Logs with traffic generation capabilities.

## Overview

This module sets up:
- A custom VPC with public subnet
- VPC Flow Logs configured to capture ACCEPT traffic
- CloudWatch Log Group for storing flow logs
- EC2 instance for generating network traffic
- Required IAM roles and policies
- Security groups with HTTP and SSH access
- SSH key pair for instance access

## Architecture

```
VPC (10.1.0.0/16)
├── Public Subnet (10.1.1.0/24, us-east-1a)
├── Internet Gateway
├── Route Table (routes to IGW)
├── VPC Flow Logs → CloudWatch Logs
└── EC2 Instance (t2.micro)
    ├── Security Group (HTTP:80, SSH:22)
    ├── IAM Instance Profile
    └── Public IP enabled
```

## Resources Created

### Networking
- **VPC**: Custom VPC with 10.1.0.0/16 CIDR block
- **Subnet**: Public subnet in us-east-1a availability zone
- **Internet Gateway**: Enables internet connectivity
- **Route**: Default route to internet gateway

### VPC Flow Logs
- **CloudWatch Log Group**: `whizvpclogs` - stores flow log data
- **VPC Flow Log**: Captures ACCEPT traffic with 60-second aggregation
- **IAM Role**: `VPCFlowLog_Role` - allows flow logs to write to CloudWatch
- **IAM Policy**: Permissions for CloudWatch Logs operations

### Compute
- **EC2 Instance**: Amazon Linux 2 instance for traffic generation
  - AMI: `ami-02e136e904f3da870`
  - Instance Type: `t2.micro`
  - Public IP: Enabled
- **Security Group**: Allows inbound HTTP (80) and SSH (22)
- **SSH Key Pair**: Auto-generated 4096-bit RSA key

### IAM
- **Instance Profile**: Attached to EC2 instance
- **IAM Role**: For VPC Flow Logs service
- **IAM Policy**: CloudWatch Logs permissions restricted to us-east-1

## Prerequisites

- AWS Account with appropriate permissions
- Terraform installed (v0.12+)
- AWS credentials configured

## Usage

1. **Configure Variables**:
   Edit `terraform.tfvars` with your AWS credentials:
   ```hcl
   region     = "us-east-1"
   access_key = "YOUR_ACCESS_KEY"
   secret_key = "YOUR_SECRET_KEY"
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Review Plan**:
   ```bash
   terraform plan
   ```

4. **Apply Configuration**:
   ```bash
   terraform apply
   ```

5. **Generate Traffic**:
   SSH into the instance and generate HTTP traffic to create flow logs:
   ```bash
   ssh -i <private_key> ec2-user@<instance_public_ip>
   curl http://example.com
   ```

6. **View Flow Logs**:
   - Navigate to CloudWatch Logs in AWS Console
   - Look for log group: `whizvpclogs`
   - View log streams for flow log entries

## Outputs

- `vpc_id`: ID of the created VPC
- `igw_id`: ID of the Internet Gateway
- `subnet_id`: ID of the public subnet
- `vpc_flow_log_id`: ID of the VPC Flow Log
- `instance_id`: ID of the EC2 instance

## VPC Flow Logs Configuration

- **Traffic Type**: `ACCEPT` - only accepted traffic is logged
- **Log Destination**: CloudWatch Logs
- **Aggregation Interval**: 60 seconds
- **Log Format**: Default AWS format

## Security Considerations

⚠️ **Important**:
- Security group allows SSH and HTTP from `0.0.0.0/0` (any IP)
- AWS credentials are stored in `terraform.tfvars` - **DO NOT commit this file**
- Consider using AWS Secrets Manager or environment variables for credentials
- Restrict security group rules to specific IP ranges in production

## Clean Up

To destroy all resources:
```bash
terraform destroy
```

## Flow Log Analysis

Flow logs contain the following information:
- Source and destination IP addresses
- Source and destination ports
- Protocol
- Number of packets and bytes
- Action taken (ACCEPT/REJECT)
- Timestamps

Example flow log entry:
```
2 123456789012 eni-1a2b3c4d 10.0.1.5 198.51.100.1 20641 443 6 20 4000 1418530010 1418530070 ACCEPT OK
```

## Dependencies

The `depends_on` argument in the EC2 instance ensures:
- Security group is fully created before instance launch
- Prevents timing issues with AWS API eventual consistency
- Guarantees proper resource creation order

## Cost Estimate

Approximate monthly costs (us-east-1):
- EC2 t2.micro: ~$8.50/month
- VPC Flow Logs: ~$0.50/GB ingested + storage costs
- CloudWatch Logs: ~$0.50/GB ingested + $0.03/GB stored
- Data Transfer: Variable based on usage

## Troubleshooting

**Issue**: EC2 instance creation fails
- Check if AMI is available in your region
- Verify security group and subnet are created
- Ensure IAM role has correct permissions

**Issue**: Flow logs not appearing
- Wait 5-10 minutes for initial log delivery
- Generate network traffic from the instance
- Check CloudWatch Logs permissions in IAM role
- Verify flow log is in ACTIVE state

**Issue**: Cannot SSH to instance
- Ensure instance has public IP
- Check security group allows port 22
- Verify route to internet gateway exists
- Download private key from Terraform state if needed

## License

This module is provided as-is for educational and demonstration purposes.
