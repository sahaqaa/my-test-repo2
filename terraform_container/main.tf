terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.37.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = "us-west-2"
  profile = "my-profile"
}

# Create a VPC
resource "aws_vpc" "my-test-vpc" {
  cidr_block = "10.10.0.0/16"
}

# Create a Subnet
resource "aws_subnet" "my-test-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.0/24"

  tags = {
    Name = "my-test"
  }
}

#Create Security Group
resource "aws_security_group" "allow_22_80_443" {
  name        = "allow_22_80_443"
  description = "Allow TCP 22 / 80 / 443 inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "TCP"
      description ="worldwide"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      description ="worldwide"
      cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "SSH"
      description ="worldwide"
      cidr_blocks = ["0.0.0.0/0"]
    }

  tags = {
    Name = "allow_tls"
  }
}

# Deploy a EC2 Instance
resource "aws_instance" "first_ec2" {
  count         = 1
  ami           = "ami-085925f297f89fce1"
  instance_type = "t2.micro"
  security_groups  = "allow_22_80_443"

  tags = {
    Name = "HelloWorld"
  }
}