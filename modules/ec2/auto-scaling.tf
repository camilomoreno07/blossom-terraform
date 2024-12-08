#AUTO-SCALING GROUP TEST-APP
resource "aws_autoscaling_group" "test_app_asg" {
  launch_template {
    id      = aws_launch_template.test_app_server_lt.id
    version = "$Latest"
  }

  vpc_zone_identifier = [var.subnet_private1.id, var.subnet_private2.id]

  target_group_arns = [aws_lb_target_group.test_app_target_group.arn]

  min_size           = 1
  max_size           = 3
  desired_capacity   = 1

  health_check_type  = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "test-app-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "test_app_scale" {
  autoscaling_group_name = aws_autoscaling_group.test_app_asg.name
  name                   = "scale-policy"
  policy_type            = "TargetTrackingScaling"
  
  target_tracking_configuration {
    target_value           = 50  
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    } 
  }
}

#AUTO-SCALING GROUP TEST-API
resource "aws_autoscaling_group" "test_api_asg" {
  launch_template {
    id      = aws_launch_template.test_api_server_lt.id
    version = "$Latest"
  }

  vpc_zone_identifier = [var.subnet_private3.id, var.subnet_private4.id]

  target_group_arns = [aws_lb_target_group.test_api_target_group.arn]

  min_size           = 1
  max_size           = 3
  desired_capacity   = 1

  health_check_type  = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "test-api-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "test_api_scale" {
  autoscaling_group_name = aws_autoscaling_group.test_api_asg.name
  name                   = "scale-policy"
  policy_type            = "TargetTrackingScaling"
  
  target_tracking_configuration {
    target_value           = 50  
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    } 
  }
}