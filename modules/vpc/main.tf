resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet-1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_1
  availability_zone       = var.az1
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet-2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_2
  availability_zone       = var.az2
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "subnet_1" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_route_table_association" "subnet_2" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_security_group" "my_sg" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "vpc_sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["106.51.195.63/32"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc_sg"
  }
}