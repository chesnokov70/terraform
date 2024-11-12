#-----------------------------------------------------
# My Terrafotm
#
# Build WebServer
#
#-----------------------------------------------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5"
    }
  }
  required_version = ">= 1.3"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_webserver_ubuntu" {
  ami                         = data.aws_ami.latest_ubuntu.id # Ubuntu amd64 (x86_64)
  instance_type               = "t2.micro"
 
  tags = {
    Name  = "Web Server Ubuntu"
    Owner = "Sergei Ches"
  }
}

resource "aws_instance" "my_webserver_linux" {
  #  count                       = 2
  ami                         = data.aws_ami.latest_linux.id # Linux amd64 (x86_64)
  instance_type               = "t2.micro"
 
  tags = {
    Name  = "Web Server Linux"
    Owner = "Sergei Ches"
  }
}

resource "aws_instance" "my_webserver_windows" {
  #  count                       = 2
  ami                         = data.aws_ami.latest_windows.id # Windows amd64 (x86_64)
  instance_type               = "t3.micro"
 
  tags = {
    Name  = "Web Server Windows"
    Owner = "Sergei Ches"
  }
}