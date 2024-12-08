resource "aws_subnet" "public_1" {
    vpc_id = aws_vpc.vpc_app.id
    cidr_block = "172.20.1.0/24"
    availability_zone = "${var.region}a"

  tags = {
    Name = "172.20.1.0 - ${var.region}a - public 1"
  }

}

resource "aws_subnet" "public_2" {
    vpc_id = aws_vpc.vpc_app.id
    cidr_block = "172.20.2.0/24"
    availability_zone = "${var.region}b"

  tags = {
    Name = "172.20.2.0 - ${var.region}b - public 2"
  }

}

resource "aws_subnet" "private_1" {
    vpc_id = aws_vpc.vpc_app.id
    cidr_block = "172.20.3.0/24"
    availability_zone = "${var.region}a"

  tags = {
    Name = "172.20.3.0 - ${var.region}a - private 1"
  }

}

resource "aws_subnet" "private_2" {
    vpc_id = aws_vpc.vpc_app.id
    cidr_block = "172.20.4.0/24"
    availability_zone = "${var.region}b"

  tags = {
    Name = "172.20.4.0 - ${var.region}b - private 2"
  }

}

resource "aws_subnet" "private_3" {
    vpc_id = aws_vpc.vpc_app.id
    cidr_block = "172.20.5.0/24"
    availability_zone = "${var.region}a"

  tags = {
    Name = "172.20.5.0 - ${var.region}a - private 3"
  }

}

resource "aws_subnet" "private_4" {
    vpc_id = aws_vpc.vpc_app.id
    cidr_block = "172.20.6.0/24"
    availability_zone = "${var.region}b"

  tags = {
    Name = "172.20.6.0 - ${var.region}b - private 4"
  }

}

resource "aws_subnet" "private_5" {
    vpc_id = aws_vpc.vpc_app.id
    cidr_block = "172.20.7.0/24"
    availability_zone = "${var.region}a"

  tags = {
    Name = "172.20.7.0 - ${var.region}a - private 5"
  }

}

resource "aws_subnet" "private_6" {
    vpc_id = aws_vpc.vpc_app.id
    cidr_block = "172.20.8.0/24"
    availability_zone = "${var.region}b"

  tags = {
    Name = "172.20.8.0 - ${var.region}b - private 6"
  }

}