# Simple Email Service (SES) Module

This Terraform module configures Amazon SES for sending emails.

## Features

- **Email Identity**: Verifies email address for sending
- **SES Configuration**: Ready for email sending
- **Domain/Email Verification**: Supports both domain and email verification

## Resources Created

1. `aws_ses_email_identity` - Verifies email address
2. Additional SES configurations as defined

## Prerequisites

- Email address to verify
- Access to email inbox for verification

## Usage

```bash
terraform init
terraform apply
```

After apply, check the email inbox and click the verification link from AWS.

## Use Cases

- Transactional emails
- Notification systems
- Marketing campaigns
- Password reset emails

## Important Notes

- SES starts in sandbox mode (limited sending)
- Request production access for unlimited sending
- Verify all recipient addresses in sandbox mode

## Cleanup

```bash
terraform destroy
```
