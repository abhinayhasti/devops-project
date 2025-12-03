output "elastic_ip" {
  description = "The public IP address of the web server"
  value       = aws_eip.lb.public_ip
}

output "aws_instance_id" {
  description = "The ID of the web server instance"
  value       = aws_instance.web-server.id
}
