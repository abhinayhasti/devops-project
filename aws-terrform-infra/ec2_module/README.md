# EC2 Instance Module

This Terraform module creates a single EC2 instance with Apache web server and security group configuration.

## Features

- **EC2 Instance**: Single t2.micro instance
- **Security Group**: Allows HTTP traffic from anywhere
- **Web Server**: Auto-installs Apache HTTP server
- **User Data**: Automated server setup on instance launch

## Resources Created

1. `aws_security_group` (web-server) - Security group allowing HTTP inbound traffic
2. `aws_instance` (web-server) - EC2 instance with Apache installed

## Prerequisites

- AWS Account with appropriate permissions
- SSH key pair named "whizlabs-key" (or update in main.tf)
- Terraform >= 0.12

## Usage

1. Update `terraform.tfvars` with your AWS credentials:
```hcl
region     = "us-east-1"
access_key = "YOUR_AWS_ACCESS_KEY"
secret_key = "YOUR_AWS_SECRET_KEY"
```

2. Initialize and apply:
```bash
terraform init
terraform plan
terraform apply
```

3. Access the instance public IP on port 80 to see Apache welcome page

## Security Configuration

- **Ingress**: HTTP (port 80) from anywhere (0.0.0.0/0)
- **Egress**: All traffic allowed

## Outputs

Check `output.tf` for available outputs (instance ID, public IP, etc.)

## Cleanup

```bash
terraform destroy
```

## Use Cases

- Simple web server deployment
- Testing and development
- Single instance applications
- Learning EC2 basics
