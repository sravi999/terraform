terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.64.2"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = var.vpc_tags
}

data "aws_ami" "amis" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu*"]
  }
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.amis.id
  instance_type = "t2.micro"
  user_data     = <<EOF
#!/bin/bash
sudo apt update
sudo apt install apache2 -y
EOF
}
