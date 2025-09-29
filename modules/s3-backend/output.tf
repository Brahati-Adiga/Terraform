output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3-bucket.bucket
}