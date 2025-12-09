# Custom VPC Module

This Terraform module creates a custom VPC with public and private subnets, internet gateway, NAT gateway, and route tables.

## Features

- **Custom VPC**: VPC with 10.0.0.0/16 CIDR block
- **Public Subnet**: Subnet with auto-assign public IP enabled
- **Private Subnet**: Isolated subnet for backend resources
- **Internet Gateway**: Enables internet access for public subnet
- **NAT Gateway**: Allows private subnet instances to access internet
- **Route Tables**: Separate routing for public and private subnets

## Resources Created

1. `aws_vpc` - Custom VPC (10.0.0.0/16)
2. `aws_subnet` (public_subnet) - Public subnet in us-east-1a
3. `aws_subnet` (private_subnet) - Private subnet in us-east-1b
4. `aws_internet_gateway` - Internet gateway for VPC
5. `aws_eip` - Elastic IP for NAT gateway
6. `aws_nat_gateway` - NAT gateway for private subnet
7. `aws_route_table` (public) - Route table for public subnet
8. `aws_route_table` (private) - Route table for private subnet
9. `aws_route_table_association` - Associates subnets with route tables

## Architecture

```
Internet
   ↓
Internet Gateway → Public Subnet (10.0.1.0/24)
                         ↓
                   NAT Gateway → Private Subnet (10.0.2.0/24)
```

## Prerequisites

- AWS Account with appropriate permissions
- Terraform >= 0.12

## Usage

```bash
terraform init
terraform plan
terraform apply
```

## Use Cases

- Multi-tier applications
- Public-facing web servers with private databases
- Network isolation and security
- Learning VPC networking concepts

## Cleanup

```bash
terraform destroy
```

**Note**: NAT Gateway incurs hourly charges even when idle.
