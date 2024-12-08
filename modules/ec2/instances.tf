/*
resource "tls_private_key" "tls_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# KEYS

resource "aws_key_pair" "server_keys" {
  key_name   = "Keys"
  public_key = tls_private_key.tls_private_key.public_key_openssh
}

# SERVERS

resource "aws_instance" "test_api_server" {
  ami           = "ami-0c80e2b6ccb9ad6d1" 
  instance_type = "t2.micro"
  key_name = aws_key_pair.server_keys.key_name
  vpc_security_group_ids = ["${aws_security_group.test_api_server_sg.id}"]
  subnet_id = "${var.subnet_private3.id}"
  iam_instance_profile = var.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              # Actualizar los paquetes instalados
              yum update -y
              # Instalar telnet
              yum install -y telnet
              # Instalar Docker
              sudo yum install -y docker
              # Iniciar Docker
              systemctl start docker
              # Habilitar Docker para iniciar al arrancar
              systemctl enable docker
              EOF

  tags = {
    Name = "test-api-server"
  }

}

resource "aws_instance" "test_app_server" {
  ami           = "ami-0c80e2b6ccb9ad6d1" 
  instance_type = "t2.micro"
  key_name = aws_key_pair.server_keys.key_name
  vpc_security_group_ids = ["${aws_security_group.test_app_server_sg.id}"]
  subnet_id = "${var.subnet_private1.id}"
  iam_instance_profile = var.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              # Actualizar los paquetes instalados
              yum update -y
              # Instalar telnet
              yum install -y telnet
              # Instalar Docker
              sudo yum install -y docker
              # Habilitar Docker para iniciar al arrancar
              systemctl enable docker
              # Iniciar Docker
              systemctl start docker
              EOF

  tags = {
    Name = "test_app_server"
  }

}*/