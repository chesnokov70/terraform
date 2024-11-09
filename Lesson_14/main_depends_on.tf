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

resource "aws_eip" "my_static_ip" {
  instance = aws_instance.my_webserver_app.id
}

resource "aws_instance" "my_webserver_db" {
  #  count                       = 2
  ami                         = "ami-0c7217cdde317cfec" # Ubuntu amd64 (x86_64)
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.my_webserver_sq.id]
  user_data                   = file("user_data.sh")
  user_data_replace_on_change = true



  tags = {
    Name  = "Web Server DataBase"
    Owner = "Sergei Ches"
  }

  lifecycle {
    # ignore_changes = ["ami", "user_data"]
    #    prevent_destroy = true
    create_before_destroy = true
  }

}

resource "aws_instance" "my_webserver_web" {
  #  count                       = 2
  ami                         = "ami-0c7217cdde317cfec" # Ubuntu amd64 (x86_64)
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.my_webserver_sq.id]
  user_data                   = file("user_data.sh")
  user_data_replace_on_change = true



  tags = {
    Name  = "Web Server Web"
    Owner = "Sergei Ches"
  }

  depends_on = [aws_instance.my_webserver_db, aws_instance.my_webserver_app]

  lifecycle {
    # ignore_changes = ["ami", "user_data"]
    #    prevent_destroy = true
    create_before_destroy = true
  }

}

resource "aws_instance" "my_webserver_app" {
  #  count                       = 2
  ami                         = "ami-0c7217cdde317cfec" # Ubuntu amd64 (x86_64)
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.my_webserver_sq.id]
  user_data                   = file("user_data.sh")
  user_data_replace_on_change = true



  tags = {
    Name  = "Web Server App"
    Owner = "Sergei Ches"
  }

  depends_on = [aws_instance.my_webserver_db]

  lifecycle {
    # ignore_changes = ["ami", "user_data"]
    #    prevent_destroy = true
    create_before_destroy = true
  }

}

resource "aws_security_group" "my_webserver_sq" {
  name        = "WebServer Security Group"
  description = "My First Security Group"

  dynamic "ingress" {
    for_each = ["80", "443", "8080", "1541", "9092"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.10.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Dynamic SG-new"
  }
}
