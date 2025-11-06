resource "aws_launch_template" "three_tier_lt" {
  name                   = "three-tier-launch-template"
  image_id               = "ami-0c02fb55956c7d316"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]
  user_data              = base64encode("#!/bin/bash\nyum update -y\nyum install -y httpd\nsystemctl start httpd\nsystemctl enable httpd\necho '<h1>Three-Tier App</h1>' > /var/www/html/index.html")
  tags = {
    Name = "three-tier-launch-template"
  }
}

resource "aws_autoscaling_group" "three_tier_asg" {
  name                = "three-tier-asg"
  vpc_zone_identifier = ["${aws_subnet.private_subnet_1a.id}", "${aws_subnet.private_subnet_1b.id}"]
  target_group_arns   = ["${aws_lb_target_group.three_tier_tg.arn}"]
  health_check_type   = "ELB"
  min_size            = 2
  max_size            = 6
  desired_capacity    = 2
  launch_template {
    id      = aws_launch_template.three_tier_lt.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "three-tier-asg-instance"
    propagate_at_launch = true
  }
}
