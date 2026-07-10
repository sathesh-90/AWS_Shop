# Create the main VPC for the demo application.
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "aws-ecommerce-demo-vpc"
  }
}

# Create a public subnet inside the VPC.
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "aws-ecommerce-demo-public-subnet"
  }
}

# Create an internet gateway so the subnet can reach the internet.
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "aws-ecommerce-demo-igw"
  }
}

# Create a route table for the public subnet.
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "aws-ecommerce-demo-public-route-table"
  }
}

# Associate the route table with the public subnet.
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
