# S3 with CloudFront Module

This Terraform module creates an S3 bucket with CloudFront CDN distribution.

## Features

- **S3 Bucket**: Origin for CloudFront
- **CloudFront Distribution**: Global CDN
- **Origin Access Identity**: Secure S3 access
- **HTTPS Support**: SSL/TLS encryption
- **Edge Caching**: Fast content delivery worldwide

## Resources Created

1. `aws_s3_bucket` - S3 bucket for content
2. `aws_cloudfront_origin_access_identity` - OAI for secure access
3. `aws_s3_bucket_policy` - Allows CloudFront to access S3
4. `aws_cloudfront_distribution` - CDN distribution

## Architecture

```
Users → CloudFront Edge Locations → S3 Origin Bucket
```

## Benefits

- **Performance**: Content cached at edge locations globally
- **Security**: S3 bucket not publicly accessible
- **Cost**: Reduced S3 data transfer costs
- **HTTPS**: Built-in SSL/TLS

## Usage

```bash
terraform init
terraform apply
```

Access content via CloudFront domain name (provided in outputs).

## Use Cases

- Static website hosting
- Media streaming
- Software distribution
- API acceleration

## Cleanup

```bash
terraform destroy
```

**Note**: CloudFront distribution deletion can take 15-20 minutes.
