# IAM Users and Groups Module

This Terraform module creates IAM users, groups, and manages permissions.

## Features

- **IAM Users**: Create AWS users
- **IAM Groups**: Organize users by role
- **Group Policies**: Assign permissions to groups
- **User-Group Membership**: Add users to groups

## Resources Created

1. `aws_iam_user` - IAM users
2. `aws_iam_group` - IAM groups
3. `aws_iam_group_policy_attachment` - Attach policies to groups
4. `aws_iam_user_group_membership` - Add users to groups

## Best Practices

- **Least Privilege**: Grant minimum required permissions
- **Group-Based**: Assign permissions via groups, not individual users
- **MFA**: Enable multi-factor authentication
- **Password Policy**: Enforce strong passwords

## Usage

```bash
terraform init
terraform apply
```

## Common Group Policies

- `AdministratorAccess` - Full AWS access
- `PowerUserAccess` - Everything except IAM
- `ReadOnlyAccess` - Read-only access
- Custom policies for specific needs

## Use Cases

- Team access management
- Role-based access control
- Developer environment setup
- Contractor temporary access

## Security Notes

⚠️ **Important**:
- Never commit access keys to version control
- Rotate credentials regularly
- Use IAM roles for applications when possible

## Cleanup

```bash
terraform destroy
```
