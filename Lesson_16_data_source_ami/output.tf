

output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "latest_ubuntu_ami_name" {
  value = data.aws_ami.latest_ubuntu.name
}


output "latest_linux_ami_id" {
  value = data.aws_ami.latest_linux.id
}

output "latest_linux_ami_name" {
  value = data.aws_ami.latest_linux.name
}


output "latest_windows_ami_id" {
  value = data.aws_ami.latest_windows.id
}

output "latest_windows_ami_name" {
  value = data.aws_ami.latest_windows.name
}
