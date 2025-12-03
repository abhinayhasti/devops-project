output "identity_arn" {
  value = aws_ses_email_identity.ses_identity.arn
  description = "identity created successfully"  
}