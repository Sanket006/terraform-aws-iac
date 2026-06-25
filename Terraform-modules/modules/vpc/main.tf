# VPC 
resource "aws_vpc" "my-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_name}"
  }
}

# Public Subnet A
resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.public_subnet_a_cidr
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet-a"
  }
}

# Public Subnet B
resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.public_subnet_b_cidr
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet-b"
  }
}

# Private Subnet A
resource "aws_subnet" "private_subnet_a" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet_a_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.vpc_name}-private-subnet-a"
  }   
}

# Private Subnet B
resource "aws_subnet" "private_subnet_b" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet_b_cidr
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${var.vpc_name}-private-subnet-b"
  }   
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.vpc_name}-nat-eip"
  } 
  
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_a.id

  tags = {
    Name = "${var.vpc_name}-nat-gw"
  } 
   
  depends_on = [ aws_internet_gateway.igw ]
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"  
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  
  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

# Route Table Association for Public Subnet A
resource "aws_route_table_association" "public_assoc_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table Association for Public Subnet B
resource "aws_route_table_association" "public_assoc_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table Association for Private Subnet A
resource "aws_route_table_association" "private_assoc_a" {
  subnet_id      = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.private_rt.id
}

# Route Table Association for Private Subnet B
resource "aws_route_table_association" "private_assoc_b" {
  subnet_id      = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.private_rt.id
}
