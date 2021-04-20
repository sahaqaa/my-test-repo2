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

# Deploy a EC2 Instance
resource "aws_instance" "first_ec2" {
  ami           = "ami-085925f297f89fce1"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
