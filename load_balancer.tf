resource "aws_lb" "three_tier_alb" {
  name                       = "three-tier-alb"
  load_balancer_type         = "application"
  security_groups            = ["${aws_security_group.alb_sg.id}"]
  subnets                    = ["${aws_subnet.public_subnet_1a.id}", "${aws_subnet.public_subnet_1b.id}"]
  enable_deletion_protection = false
  tags = {
    Name = "three-tier-alb"
  }
}

resource "aws_lb_target_group" "three_tier_tg" {
  name     = "three-tier-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.three_tier_vpc.id
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
  tags = {
    Name      = "three_tier_tg"
    ManagedBy = "Infrara"
  }
}

resource "aws_lb_listener" "three_tier_listener" {
  load_balancer_arn = aws_lb.three_tier_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.three_tier_tg.arn
  }
  tags = {
    Name      = "three_tier_listener"
    ManagedBy = "Infrara"
  }
}
