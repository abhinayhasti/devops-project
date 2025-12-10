variable "access_key" {
  description = "Access key to AWS console"
  type        = string
  default     = "YOUR_AWS_ACCESS_KEY"
}

variable "secret_key" {
  description = "Secret key to AWS console"
  type        = string
  default     = "YOUR_AWS_SECRET_KEY"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
