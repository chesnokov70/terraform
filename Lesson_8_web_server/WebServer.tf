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
  count                  = 2
  ami                    = "ami-0c7217cdde317cfec" # Ubuntu amd64 (x86_64)
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver_sq.id]
  user_data              = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
    sudo systemctl start apache2
    sudo systemctl enable apache2
    sudo bash -c 'cat > /var/www/html/index.html' <<EOF_HTML
    <!DOCTYPE html>
    <html>
    <head>
    <style>
      body {
        background-color: #A1B0FF;
        text-align: center;
      }
    </style>
    </head>
    <body>
      <h1>Hello, Team.</h1>
      <h1>Welcome to server with IP: $myip, Created by Terraform !</h1> 
    </body>
    </html>
    EOF_HTML
  EOF

  tags = {  
    Name = "Web Server Build By Terraform"
    Owner = "Sergei Ches"
  }
}

#-------------------------------------




resource "aws_security_group" "my_webserver_sq" {
  name        = "WebServer Security Group"
  description = "My First Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web Server SG"
  }
}

