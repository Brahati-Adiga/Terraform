output "instance_1_public_ip" {
  description = "Public IP of instance-1"
  value       = aws_instance.instance-1.public_ip
}

output "instance_2_public_ip" {
  description = "Public IP of instance-2"
  value       = aws_instance.instance-2.public_ip
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3-bucket.bucket
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}

output "aws_lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.alb.dns_name
}