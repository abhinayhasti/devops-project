# Application Load Balancer (ALB) Module

This Terraform module creates an Application Load Balancer with EC2 instances and demonstrates load balancing across multiple availability zones.

## Features

- **Application Load Balancer**: HTTP load balancer in default VPC
- **Multiple EC2 Instances**: 2 EC2 instances for high availability
- **Security Groups**: Separate security groups for ALB and EC2 instances
- **Target Group**: Configures health checks and routing
- **User Data**: Apache web server installation on EC2 instances

## Resources Created

1. `aws_security_group` (alb_sg) - Security group for ALB allowing HTTP traffic
2. `aws_security_group` (ec2_sg) - Security group for EC2 instances allowing traffic from ALB only
3. `aws_instance` - 2 EC2 instances with Apache web server
4. `aws_lb_target_group` - Target group for routing traffic
5. `aws_lb_target_group_attachment` - Attaches EC2 instances to target group
6. `aws_lb` - Application Load Balancer
7. `aws_lb_listener` - HTTP listener on port 80

## Architecture

```
Internet → ALB (Port 80) → Target Group → EC2 Instances (Port 80)
```

## Prerequisites

- AWS Account with appropriate permissions
- Default VPC available
- SSH key pair named "whizlabs-key" (or update in main.tf)
- Terraform >= 0.12

## Usage

1. Update `terraform.tfvars` with your AWS credentials:
```hcl
region     = "us-east-1"
access_key = "YOUR_AWS_ACCESS_KEY"
secret_key = "YOUR_AWS_SECRET_KEY"
```

2. Initialize Terraform:
```bash
terraform init
```

3. Review the execution plan:
```bash
terraform plan
```

4. Apply the configuration:
```bash
terraform apply
```

5. Access the ALB DNS name to see the load-balanced application

## Security Configuration

- **ALB Security Group**: Allows HTTP (port 80) from anywhere (0.0.0.0/0)
- **EC2 Security Group**: Allows HTTP (port 80) only from ALB security group
- **Network Isolation**: EC2 instances are not directly accessible from internet

## Outputs

The module outputs the ALB DNS name which you can use to access the application.

## Cleanup

```bash
terraform destroy
```

## Use Cases

- Web application high availability
- Load balancing across multiple servers
- Traffic distribution
- Health check monitoring
- Blue-green deployments

## Notes

- Instances use Apache web server for demonstration
- Health checks configured on port 80
- Uses default VPC and subnets
- AMI is region-specific (update if needed)
