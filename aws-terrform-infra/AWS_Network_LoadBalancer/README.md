# AWS Network Load Balancer with Terraform

This project creates an AWS Network Load Balancer (NLB) with two target groups routing traffic to Apache (port 80) and Nginx (port 8080) on the same EC2 instance.

## Architecture

- **VPC**: Default VPC
- **Subnets**: 2 subnets in us-east-1a and us-east-1b
- **EC2 Instance**: Single t2.micro instance running both Apache and Nginx
- **Network Load Balancer**: Routes traffic to different ports
  - Port 80 → Apache Target Group
  - Port 8080 → Nginx Target Group

## Common Mistake and Fix

### ❌ The Mistake I Made

**Problem**: Port 8080 was not responding when trying to access the NLB DNS URL.

**Error**: 
```
Connection refused / Connection timeout on port 8080
```

**Root Cause**: 
I created a target group for Nginx on port 8080, but the EC2 instance **user_data script only installed Apache on port 80**. Nginx was never installed or configured, so nothing was listening on port 8080.

The original user_data only had:
```bash
#!/bin/bash
sudo su
yum update -y
yum install httpd -y          # Only Apache installed
systemctl start httpd
systemctl enable httpd
echo "<html> <h1> Response coming from server </h1> </html>" >> /var/www/html/index.html
```

### ✅ How I Fixed It

**Solution**: Updated the user_data script to install and configure **both Apache and Nginx**:

1. **Install Apache** on default port 80
2. **Install Nginx** and configure it to listen on port 8080
3. Create separate index pages for each server to identify which one is responding

Updated user_data:
```bash
#!/bin/bash
sudo su
yum update -y

# Install and configure Apache on port 80
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<html> <h1> Response coming from Apache server on port 80 </h1> </html>" > /var/www/html/index.html

# Install and configure Nginx on port 8080
yum install nginx -y

# Configure Nginx to listen on port 8080
cat > /etc/nginx/conf.d/port8080.conf <<'NGINX_EOF'
server {
    listen 8080;
    server_name _;
    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
NGINX_EOF

# Create custom index page for Nginx
echo "<html> <h1> Response coming from Nginx server on port 8080 </h1> </html>" > /usr/share/nginx/html/index.html

# Start and enable Nginx
systemctl start nginx
systemctl enable nginx
```

**Apply the fix**:
```bash
terraform apply -auto-approve -replace="aws_instance.ec2"
```

This command recreates the EC2 instance with the updated user_data.

## Key Learnings

1. **Target Group ≠ Application**: Creating a target group for a port doesn't automatically install or configure the application to listen on that port.

2. **User Data is Critical**: The user_data script must install and configure ALL services that the target groups expect to be available.

3. **Port Configuration**: When running multiple web servers on the same instance, make sure to configure them on different ports to avoid conflicts.

4. **Security Group Rules**: We have 3 ingress rules (22, 80, 8080) and 1 egress rule (all traffic):
   - Multiple ingress rules to allow specific incoming traffic
   - Single egress rule allows all outbound traffic

## Testing

After applying the fix, test both endpoints:

```bash
# Test Apache on port 80
curl http://<NLB-DNS>:80

# Test Nginx on port 8080
curl http://<NLB-DNS>:8080
```

Replace `<NLB-DNS>` with your actual NLB DNS name (check terraform outputs).

## Files

- `main.tf` - Main Terraform configuration
- `variable.tf` - Variable definitions
- `terraform.tfvars` - Variable values (contains sensitive data)
- `output.tf` - Output values
- `README.md` - This file

## Important Notes

- Wait 30-60 seconds after instance creation for services to fully start
- Target groups perform health checks before routing traffic
- Both services run on the same EC2 instance on different ports
