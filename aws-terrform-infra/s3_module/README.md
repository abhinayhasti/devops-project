# S3 Bucket Module

This Terraform module creates an S3 bucket configured for static website hosting.

## Features

- **S3 Bucket**: Storage bucket with random name suffix
- **Website Hosting**: Configured for static website
- **Public Access**: Publicly accessible website

## Resources Created

1. `random_string` - Generates unique bucket name suffix
2. `aws_s3_bucket` - S3 bucket with force destroy enabled
3. `aws_s3_bucket_website_configuration` - Website hosting configuration

## Configuration

- **Bucket Naming**: whizbucket-{random}
- **Index Document**: index.html
- **Force Destroy**: true (deletes all objects on destroy)

## Usage

```bash
terraform init
terraform apply
```

Upload `index.html` to the bucket to serve your static website.

## Use Cases

- Static website hosting
- Frontend application deployment
- Documentation hosting
- Portfolio websites

## Cleanup

```bash
terraform destroy
```
