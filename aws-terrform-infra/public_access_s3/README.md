# Public Access S3 Bucket

This Terraform module creates an S3 bucket with public access enabled.

## Features

- **Public S3 Bucket**: Configured for public read access
- **Bucket Policy**: Allows GetObject from anywhere
- **Public Access Settings**: Disabled blocking

## Resources Created

1. `aws_s3_bucket` - S3 bucket
2. `aws_s3_bucket_public_access_block` - Public access enabled
3. `aws_s3_bucket_policy` - Public read policy

## Security Warning

⚠️ **WARNING**: All objects in this bucket are publicly readable.

## Usage

```bash
terraform init
terraform apply
```

Upload files that should be publicly accessible.

## Use Cases

- Public downloads
- Static assets
- Publicly shared files

## Cleanup

```bash
terraform destroy
```
