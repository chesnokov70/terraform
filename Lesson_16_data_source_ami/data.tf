
data "aws_ami" "latest_ubuntu" {
  owners = ["099720109477"]
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

data "aws_ami" "latest_linux" {
  owners = ["137112412989"]
  most_recent = true
  filter {
    name = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
}


data "aws_ami" "latest_windows" {
  owners = ["801119661308"]
  most_recent = true
  filter {
    name = "name"
    values = ["Windows_Server-2025-English-Core-Base-*"]
  }
}
