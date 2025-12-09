# CloudFormation Stack Deployment Module

This Terraform module deploys AWS resources using CloudFormation templates via Terraform.

## Features

- **CloudFormation Integration**: Use CloudFormation templates in Terraform
- **Stack Management**: Create, update, and delete CloudFormation stacks
- **Parameter Support**: Pass parameters to templates
- **Output Values**: Retrieve stack outputs
- **Change Sets**: Preview changes before applying

## Resources Created

1. `aws_cloudformation_stack` - CloudFormation stack
2. Resources defined in the CloudFormation template

## Why Use This Module?

### Hybrid Approach Benefits
- **Leverage Existing Templates**: Reuse CloudFormation templates
- **Terraform Workflow**: Use Terraform's state management
- **Gradual Migration**: Migrate from CloudFormation to Terraform incrementally
- **Template Libraries**: Use AWS Quick Starts and sample templates

## CloudFormation Template Formats

- **JSON**: Traditional format
- **YAML**: More readable format

## Usage

```bash
terraform init
terraform apply
```

## Template Sources

Templates can be:
- Inline (embedded in Terraform)
- Local file
- S3 bucket URL

## Use Cases

- **Quick Starts**: Deploy AWS Quick Start templates
- **Complex Stacks**: Use existing CloudFormation templates
- **Migration**: Transition from CloudFormation to Terraform
- **Compliance**: Use approved CloudFormation templates

## Stack Parameters

Pass parameters to CloudFormation template:
```hcl
parameters = {
  InstanceType = "t2.micro"
  KeyName      = "my-key"
}
```

## Outputs

Access CloudFormation stack outputs:
```hcl
output "stack_output" {
  value = aws_cloudformation_stack.stack.outputs
}
```

## Cleanup

```bash
terraform destroy
```

This will delete the CloudFormation stack and all its resources.

## Important Notes

- CloudFormation and Terraform manage state differently
- Changing templates may cause resource replacement
- Monitor stack events in CloudFormation console
- Stack rollback on failure (configurable)
