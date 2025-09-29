output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_1_id" {
  value = aws_subnet.subnet-1.id
}

output "subnet_2_id" {
  value = aws_subnet.subnet-2.id
}

output "sg_id" {
  value = aws_security_group.my_sg.id
}