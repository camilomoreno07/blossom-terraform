#ALB
resource "aws_lb" "test_app_alb" {
  name               = "test-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [var.subnet_public1.id, var.subnet_public2.id]

  enable_deletion_protection = false

  tags = {
    Name        = "test-app-alb"
    Environment = "production"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.test_app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test_app_target_group.arn
  }
}

resource "aws_lb_target_group" "test_app_target_group" {
  name        = "test-app-target-group"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_name.id
  target_type = "instance"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "test-app-target-group"
  }
}

#NLB
resource "aws_lb" "test_api_nlb" {
  name               = "test-api-nlb"
  internal           = true  
  load_balancer_type = "network"  
  security_groups    = [aws_security_group.nlb_sg.id]
  subnets            = [var.subnet_private3.id, var.subnet_private4.id] 

  enable_deletion_protection = false

  tags = {
    Name        = "test-api"
    Environment = "production"
  }
}

resource "aws_lb_listener" "tcp_listener" {
  load_balancer_arn = aws_lb.test_api_nlb.arn
  port              = "4000"  
  protocol          = "TCP"   

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test_api_target_group.arn
  }
}

resource "aws_lb_target_group" "test_api_target_group" {
  name        = "test-api-target-group"
  port        = 4000
  protocol    = "TCP" 
  vpc_id      = var.vpc_name.id
  target_type = "instance"
  health_check {
    protocol            = "TCP" 
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "test-api-target-group"
  }
}