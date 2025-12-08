# RDS Instance with EC2 Module

## Setup Steps

1. **Create a variables file**
   - Define the required variables for AWS credentials and region configuration

2. **Create a security group for RDS and EC2 in main.tf file**
   - Configure security groups with appropriate ingress and egress rules
   - Set up security group for RDS database access
   - Set up security group for EC2 instance access

3. **Adding RDS Instance in main.tf file**
   - Configure RDS instance with required parameters
   - Set up database engine, version, and instance class
   - Configure storage and backup settings

4. **Add EC2 Instance creation in the main.tf file**
   - Define EC2 instance configuration
   - Specify AMI, instance type, and key pair
   - Associate with the appropriate security group

5. **Create an output file**
   - Define outputs for RDS endpoint
   - Define outputs for EC2 instance details

6. **Apply Terraform configurations**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

7. **Check the resources in the AWS Console**
   - Verify RDS instance is running
   - Verify EC2 instance is running
   - Confirm security groups are properly configured

8. **Create a database, table and insert data for testing**
   - Connect to RDS instance from EC2
   - Create test database and tables
   - Insert sample data to verify connectivity
