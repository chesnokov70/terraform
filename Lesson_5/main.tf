provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ubuntu" {
  count         = 5
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
}

resource "aws_instance" "my_linux" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = "t2.micro"
}
