#-----------------------------------------------------
# My Terrafotm
#
# Build WebServer
#
#-----------------------------------------------------
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_webserver" {
  count                       = 2
  ami                         = "ami-0c7217cdde317cfec" # Ubuntu amd64 (x86_64)
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.my_webserver_sq.id]
  user_data                   = file("user_data.sh")
  user_data_replace_on_change = true


  tags = {
    Name  = "Web Server Build By Terraform"
    Owner = "Sergei Ches"
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
    Name = "Dynamic SG"
  }
}

