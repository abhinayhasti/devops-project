output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.application_lb.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.application_lb.arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.target_group.arn
}

output "alb_security_group_id" {
  description = "Security group ID of the ALB"
  value       = aws_security_group.alb_sg.id
}

output "ec2_security_group_id" {
  description = "Security group ID of the EC2 instances"
  value       = aws_security_group.ec2_sg.id
}

output "ec2_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.web_server[*].id
}

output "ec2_instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = aws_instance.web_server[*].private_ip
}

output "alb_listener_arn" {
  description = "ARN of the ALB listener"
  value       = aws_lb_listener.alb_listener.arn
}
