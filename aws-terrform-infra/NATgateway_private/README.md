# NAT Gateway with Public and Private Subnets - Terraform

This Terraform project creates a VPC with public and private subnets, launches EC2 instances in both subnets, and configures a NAT Gateway to provide internet access to instances in the private subnet.

## Architecture

- **VPC**: 10.0.0.0/16
- **Public Subnet**: 10.0.0.0/24
- **Private Subnet**: 10.0.1.0/24
- **Internet Gateway**: Attached to VPC for public subnet internet access
- **NAT Gateway**: Provides internet access for private subnet (if configured)
- **EC2 Instances**: 
  - Public instance with public IP
  - Private instance without public IP

## Prerequisites

- Terraform installed (v1.0+)
- AWS Account with appropriate credentials
- AWS CLI configured (optional)

## Files Structure

```
.
├── main.tf           # Main configuration file with all resources
├── variables.tf      # Variable declarations
├── terraform.tfvars  # Variable values (AWS credentials)
├── output.tf         # Output definitions
└── README.md         # This file
```

## Setup Instructions

### 1. Configure AWS Credentials

Edit `terraform.tfvars` with your AWS credentials:

```hcl
region = "us-east-1"
access_key = "<YOUR_AWS_ACCESS_KEY>"
secret_key = "<YOUR_AWS_SECRET_KEY>"
```

### 2. Create EC2 Key Pair

Before running Terraform, create a key pair named `WhizKey` in AWS:

```bash
aws ec2 create-key-pair --key-name WhizKey --region us-east-1 --query 'KeyMaterial' --output text > WhizKey.pem
chmod 400 WhizKey.pem
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review Execution Plan

```bash
terraform plan
```

### 5. Apply Configuration

```bash
terraform apply
```

Type `yes` when prompted to confirm.

## Resources Created

1. **VPC** (`aws_vpc.vpc`)
2. **Subnets**:
   - Public Subnet (`aws_subnet.subnet1`)
   - Private Subnet (`aws_subnet.subnet2`)
3. **Internet Gateway** (`aws_internet_gateway.igw`)
4. **Route Table** (`aws_route_table.routetable`)
5. **Security Group** (`aws_security_group.ec2sg`)
   - Ingress: SSH (port 22) from anywhere
   - Egress: All traffic
6. **EC2 Instances**:
   - Public Instance (`aws_instance.public_instance`)
   - Private Instance (`aws_instance.private_instance`)

## Outputs

After successful deployment, Terraform outputs:

- `ec2`: Public EC2 instance ID
- `ec2_2`: Private EC2 instance ID

## Testing Internet Connectivity

### Public Instance

1. SSH into the public instance using EC2 Instance Connect or:
```bash
ssh -i WhizKey.pem ec2-user@<PUBLIC_IP>
```

2. Test internet connectivity:
```bash
sudo su
sudo dnf -y update
```

### Private Instance

1. SSH into the public instance first
2. Copy the WhizKey.pem to the public instance
3. SSH into the private instance using its private IP:
```bash
ssh -i WhizKey.pem ec2-user@<PRIVATE_IP>
```

4. Test connectivity (will fail without NAT Gateway):
```bash
sudo su
sudo dnf -y update
```

## Adding NAT Gateway (Optional)

To enable internet access for the private subnet, add the following to `main.tf`:

```hcl
# Creating NAT Gateway
resource "aws_nat_gateway" "NATGateway" {
  allocation_id = aws_eip.elasticIP.id
  subnet_id     = aws_subnet.subnet1.id
  tags = {
    Name = "MyNATGateway"
  }
}

resource "aws_eip" "elasticIP" {
  domain = "vpc"
}

# Update Route Table
resource "aws_route" "update" {
  route_table_id         = aws_vpc.vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NATGateway.id
}
```

Then run `terraform apply` again.

## Clean Up

To destroy all created resources:

```bash
terraform destroy
```

Type `yes` when prompted to confirm.

## Security Notes

- **Never commit** `terraform.tfvars` or `WhizKey.pem` to version control
- Add these files to `.gitignore`:
  ```
  *.tfvars
  *.pem
  terraform.tfstate
  terraform.tfstate.backup
  .terraform/
  ```
- The security group allows SSH from anywhere (0.0.0.0/0) - restrict this in production
- Store AWS credentials securely and rotate them regularly

## Troubleshooting

### Key Pair Not Found
If you get `InvalidKeyPair.NotFound` error:
- Ensure the key pair exists in the correct region (us-east-1)
- Create it using the AWS CLI command provided above

### Authentication Errors
- Verify your AWS credentials in `terraform.tfvars`
- Check if credentials have expired (common with temporary credentials)

### Subnet Association Issues
- Ensure the VPC and subnets are created before instances
- Terraform handles dependencies automatically

## License

This project is for educational purposes.
