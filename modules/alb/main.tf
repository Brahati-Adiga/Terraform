resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = "application"

  security_groups            = [var.sg_id]
  subnets                    = [var.subnet_1, var.subnet_2]
  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_target_group" "tg" {
  name     = var.tg_name
  port     = var.port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path              = "/"
    protocol          = "HTTP"
    port              = "traffic-port"
    healthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "instance-1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instance_1_id
  port             = var.port
}

resource "aws_lb_target_group_attachment" "instance-2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.instance_2_id
  port             = var.port
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
