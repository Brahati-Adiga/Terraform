variable "port" {
  description = "The port on which the load balancer will listen"
  type = number
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type = string
}

variable "tg_name" {
  description = "Target group name"
  type        = string
}

variable "alb_internal" {
  description = "Boolean to specify if the ALB is internal"
  type        = bool
}

variable "subnet_1" {
}

variable "subnet_2" {
}

variable "sg_id" {
}

variable "vpc_id" {
}

variable "instance_1_id" {
}

variable "instance_2_id" {
}
