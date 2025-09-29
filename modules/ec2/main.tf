resource "aws_key_pair" "key" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "instance-1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_1
  key_name               = aws_key_pair.key.key_name
  vpc_security_group_ids = [var.sg_id]
  user_data              = base64encode(file("userdata-1.sh"))
}

resource "aws_instance" "instance-2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_2
  key_name               = aws_key_pair.key.key_name
  vpc_security_group_ids = [var.sg_id]
  user_data              = base64encode(file("userdata-2.sh"))
}