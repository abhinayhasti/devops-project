variable "access_key" {
    description = "Access key to AWS console"
    type        = string
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

variable "vpc_id" {
    description = "VPC ID where the security group will be created"
    type        = string
}
