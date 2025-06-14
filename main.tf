terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "Yatsurugi"

    workspaces {
      name = "Terraform2025"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Security group managed by Terraform"
  vpc_id      = "vpc-13150474"

  ingress {
    description      = "Hulft Test"
    from_port        = 30000
    to_port          = 30000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-security-group"
    Env  = "dev"
  }
}
