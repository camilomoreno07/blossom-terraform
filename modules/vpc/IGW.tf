resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_app.id

  tags = {
    Name = "blossom-igw"
  }
  
}