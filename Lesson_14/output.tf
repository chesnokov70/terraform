output "webserver_instance_id" {
  value = aws_instance.my_webserver_app.id
}

output "webserver_public_ip_address" {
  value = aws_eip.my_static_ip.public_ip
}

output "webserver_privat_ip_address" {
  value = aws_eip.my_static_ip.private_ip
}

output "webserver_sg_id" {
  value       = aws_security_group.my_webserver_sq.id
  description = "This is security group id"
}
