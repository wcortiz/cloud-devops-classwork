terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc_aula" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "red_Wilson"
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

resource "aws_security_group" "web_sg" {
  name   = "terraform-web-sg"
  vpc_id = aws_vpc.vpc_aula.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_p0000000000000ort  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}