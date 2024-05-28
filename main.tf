terraform {
  required_version = "~>1.8.3"
  backend "s3" {
    bucket = "syed-terraform"
    key = "terraform/terraform.tfstate"
    region = "ap-south-1"

    
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.51.1"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0f58b397bc5c1f2e8"
  count = 1
  instance_type = "t2.micro"
  key_name = "terraform-keypair"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Test-server"
  }
}