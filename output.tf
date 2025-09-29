output "instance_1_public_ip" {
  description = "Public IP of instance-1"
  value       = module.ec2.instance_1_public_ip
}

output "instance_2_public_ip" {
  description = "Public IP of instance-2"
  value       = module.ec2.instance_2_public_ip
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3-backend.s3_bucket_name
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.VPC.vpc_id
}

output "aws_lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.alb.aws_lb_dns_name
}