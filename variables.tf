variable "cidr_block" {
  description = "value for cidr_block"
  default     = "10.0.0.0/16"
}

variable "cidr_block_1" {
  description = "value for cidr_block_1"
  default     = "10.0.0.0/24"
}

variable "cidr_block_2" {
  description = "value for cidr_block_2"
  default     = "10.0.1.0/24"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance" # Example AMI ID, replace with a valid one for your region
  default     = "ami-0360c520857e3138f"
}

variable "instance_type" {
  description = "Type of instance"
  default     = "t2.micro"
}
