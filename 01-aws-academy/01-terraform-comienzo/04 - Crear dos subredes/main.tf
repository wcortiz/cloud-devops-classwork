provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc_aula" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "red_principal_Wilson"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id     = aws_vpc.vpc_aula.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet_a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id     = aws_vpc.vpc_aula.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet_b"
  }
}