variable "access_key" {
  description = "Access key to AWS console"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Secret key to AWS console"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "master_password" {
  description = "Master DB password (use secure method in production)"
  type        = string
  sensitive   = true
}
