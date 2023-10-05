resource "aws_vpc" "vpc-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet-main" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    "Name" = "subnet-terraform"
  }
}

resource "aws_internet_gateway" "internet-gtw" {
  vpc_id = aws_vpc.vpc-main.id

  tags = {
    "Name" = "gtw-terraform"
  }
}

resource "aws_security_group" "sg" {
  name   = "default-sg"
  vpc_id = aws_vpc.vpc-main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gtw.id
  }

  tags = {
    "Name" = "route-terraform"
  }
}

resource "aws_route_table_association" "route-table-association" {
  subnet_id      = aws_subnet.subnet-main.id
  route_table_id = aws_route_table.route-table.id
}


