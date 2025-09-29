variable "ami_id" {
  description = "The AMI ID for the EC2 instance" # Example AMI ID, replace with a valid one for your region
  type = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
}

variable "subnet_1" {}
variable "subnet_2" {}
variable "sg_id" {}