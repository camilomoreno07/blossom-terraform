resource "aws_vpc" "vpc_app" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "blossom-vpc"
  }

}