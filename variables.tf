variable "cidr_block" {
  description = "value for cidr_block"
}

variable "cidr_block_1" {
  description = "value for cidr_block_1"
}

variable "cidr_block_2" {
  description = "value for cidr_block_2"
}

variable "az1" {
}

variable "az2" {
}

variable "vpc_name" {
}

variable "bucket_name" {
    description = "Globally unique name for the S3 bucket"
}

variable "object_lock_enabled" {
    description = "Enable object lock for the S3 bucket"
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. If versioning is enabled, this also deletes all versions of all objects in the bucket."
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Type of instance"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
}

variable "port" {
  description = "The port on which the load balancer will listen"
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
}

variable "tg_name" {
  description = "Target group name"
}

variable "alb_internal" {
  description = "Boolean to specify if the ALB is internal"
}
