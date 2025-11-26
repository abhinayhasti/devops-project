output "s3_bucket" {
  value = aws_s3_bucket_website_configuration.blog.website_endpoint 
}