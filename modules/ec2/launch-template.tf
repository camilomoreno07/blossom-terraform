resource "tls_private_key" "tls_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# KEYS

resource "aws_key_pair" "server_keys" {
  key_name   = "Keys"
  public_key = tls_private_key.tls_private_key.public_key_openssh
}

resource "aws_launch_template" "test_api_server_lt" {
  name = "test-api-server-lt"

  image_id      = "ami-0c80e2b6ccb9ad6d1"
  instance_type = "t2.micro"

  key_name = aws_key_pair.server_keys.key_name

  iam_instance_profile {
    name = var.ec2_profile.name
  }
  
  network_interfaces {
    subnet_id                   = var.subnet_private3.id
    associate_public_ip_address = false
    security_groups             = ["${aws_security_group.test_api_server_sg.id}"]
  }

  user_data = filebase64("/modules/ec2/test-api-script.sh")

  block_device_mappings {
    device_name = "/dev/xvda" 
    ebs {
      volume_size          = 8
      volume_type          = "gp3"
      iops                 = 3000
      throughput           = 125
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test-api-server"
    }
  }
}


resource "aws_launch_template" "test_app_server_lt" {
  name = "test-app-server-lt"

  image_id      = "ami-0c80e2b6ccb9ad6d1"
  instance_type = "t2.micro"

  key_name = aws_key_pair.server_keys.key_name

  iam_instance_profile {
    name = var.ec2_profile.name
  }

  network_interfaces {
    subnet_id                     = "${var.subnet_private1.id}"
    associate_public_ip_address   = false
    security_groups               = ["${aws_security_group.test_app_server_sg.id}"]
  }

  user_data = base64encode(
    templatefile("${path.module}/test-app-script.sh", {
      BACKEND_URL = aws_lb.test_api_nlb.dns_name
    })
  )

  block_device_mappings {
    device_name = "/dev/xvda" 
    ebs {
      volume_size          = 8
      volume_type          = "gp3"
      iops                 = 3000
      throughput           = 125
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test_app_server"
    }
  }
}
