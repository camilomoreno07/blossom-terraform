output "vpc_name" {
  value = aws_vpc.vpc_app
}

output "subnet_public1" {
  value = aws_subnet.public_1
}

output "subnet_public2" {
  value = aws_subnet.public_2
}

output "subnet_private1" {
  value = aws_subnet.private_1
}

output "subnet_private2" {
  value = aws_subnet.private_2
}

output "subnet_private3" {
  value = aws_subnet.private_3
}

output "subnet_private4" {
  value = aws_subnet.private_4
}

output "subnet_private5" {
  value = aws_subnet.private_5
}

output "subnet_private6" {
  value = aws_subnet.private_6
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}
