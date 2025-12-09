# Elastic IP with EC2 Module

This Terraform module creates an EC2 instance with an Elastic IP address for a static public IP.

## Features

- **EC2 Instance**: Amazon Linux 2023 with Apache web server
- **Elastic IP**: Static public IP address
- **Auto AMI**: Fetches latest Amazon Linux 2023 AMI dynamically
- **Security Group**: Allows HTTP traffic

## Resources Created

1. `data.aws_ssm_parameter` - Fetches latest AL2023 AMI
2. `aws_security_group` - Security group for HTTP access
3. `aws_instance` - EC2 instance with Apache
4. `aws_eip` - Elastic IP address
5. `aws_eip_association` - Associates EIP with instance

## Benefits of Elastic IP

- **Static IP**: IP doesn't change even if instance stops/starts
- **DNS Mapping**: Can map to domain names
- **Failover**: Can reassign to another instance quickly

## Usage

```bash
terraform init
terraform apply
```

The Elastic IP will remain constant across instance restarts.

## Use Cases

- Production web servers needing static IPs
- Services requiring IP whitelisting
- DNS A-record mappings
- Email servers

## Cleanup

```bash
terraform destroy
```

**Note**: Elastic IPs incur charges when not associated with a running instance.
