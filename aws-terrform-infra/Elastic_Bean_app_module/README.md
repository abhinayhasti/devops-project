# Elastic Beanstalk Application Module

This Terraform module creates an AWS Elastic Beanstalk application and environment.

## Features

- **Managed Platform**: AWS handles infrastructure
- **Auto Scaling**: Automatic scaling based on load
- **Load Balancer**: Built-in load balancing
- **Monitoring**: CloudWatch integration
- **Easy Deployments**: Simple application updates

## Resources Created

1. `aws_elastic_beanstalk_application` - Beanstalk application
2. `aws_elastic_beanstalk_environment` - Application environment
3. Auto-created resources (EC2, ELB, Auto Scaling, Security Groups)

## Supported Platforms

- **Languages**: Python, Node.js, Java, .NET, PHP, Ruby, Go
- **Containers**: Docker single/multi-container
- **Custom**: Packer or custom AMI

## Benefits

- **Simplicity**: Deploy code without managing infrastructure
- **Flexibility**: Full control if needed via .ebextensions
- **Cost Effective**: Pay only for underlying resources
- **Integrated**: Works with RDS, S3, CloudWatch

## Usage

```bash
terraform init
terraform apply
```

Deploy your application:
```bash
eb deploy
```

## Environment Tiers

### Web Server Tier
- Handles HTTP(S) requests
- Includes load balancer
- Auto-scaling EC2 instances

### Worker Tier
- Processes background jobs
- SQS queue integration
- No load balancer

## Use Cases

- Web applications
- API backends
- Microservices
- Rapid prototyping

## Cleanup

```bash
terraform destroy
```

**Note**: Beanstalk environments can take 5-10 minutes to create/destroy.
