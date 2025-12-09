# EventBridge Rule with EC2 Module

This Terraform module creates EventBridge rules to automate EC2 instance management.

## Features

- **EventBridge Rules**: Schedule or event-driven automation
- **EC2 Automation**: Start/stop instances automatically
- **Cost Optimization**: Stop instances during non-business hours
- **Lambda Integration**: Custom automation logic

## Resources Created

1. `aws_cloudwatch_event_rule` - EventBridge rule(s)
2. `aws_cloudwatch_event_target` - Rule targets
3. `aws_iam_role` - IAM role for EventBridge
4. `aws_ec2_instance` - EC2 instance(s) to manage

## Common Use Cases

### Scheduled Actions
- **Stop instances at night**: Save costs during off-hours
- **Start instances in morning**: Ready for business hours
- **Weekly snapshots**: Automated backup schedule

### Event-Driven Actions
- **Auto-remediation**: Fix non-compliant instances
- **Scaling triggers**: Based on CloudWatch alarms
- **State change notifications**: Alert on instance state changes

## Schedule Examples

```hcl
# Stop instances at 7 PM daily
schedule_expression = "cron(0 19 * * ? *)"

# Start instances at 8 AM on weekdays
schedule_expression = "cron(0 8 ? * MON-FRI *)"
```

## Usage

```bash
terraform init
terraform apply
```

## Cost Savings

Stopping instances during 12 non-business hours daily:
- **Savings**: ~50% on EC2 compute costs
- **Example**: t3.medium running 24/7 vs 12 hours/day

## Cleanup

```bash
terraform destroy
```
