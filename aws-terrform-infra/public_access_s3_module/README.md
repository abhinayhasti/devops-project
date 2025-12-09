# Public Access S3 Module

This Terraform module creates an S3 bucket configured for public access.

## Features

- **S3 Bucket**: Publicly accessible bucket
- **Public Access Block**: Disabled for public access
- **Bucket Policy**: Allows public read access
- **ACL**: Public-read configuration

## Resources Created

1. `aws_s3_bucket` - S3 bucket
2. `aws_s3_bucket_public_access_block` - Public access configuration
3. `aws_s3_bucket_policy` - Bucket policy for public reads
4. `aws_s3_bucket_acl` - Access control list

## Security Warning

⚠️ **WARNING**: This configuration makes ALL bucket contents publicly accessible.
Only use for:
- Public website assets
- Public downloads
- Open data sets

**Never** store sensitive data in public buckets.

## Usage

```bash
terraform init
terraform apply
```

## Use Cases

- Public file hosting
- Static website assets
- Public downloads
- CDN origin

## Cleanup

```bash
terraform destroy
```
