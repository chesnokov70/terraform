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

output "data_aws_availability_zones" {
  #  value = data.aws_availability_zones.working.names
  value = data.aws_availability_zones.working.names[1]
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}

output "data_aws_region_name" {
  value = data.aws_region.current.name
}

output "data_aws_description" {
  value = data.aws_region.current.description
}

output "data_aws_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}

output "aws_prod_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}

output "aws_prod_vpc_cidr" {
  value = data.aws_vpc.prod_vpc.cidr_block
}
