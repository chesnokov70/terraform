resource "aws_subnet" "prod_subnet_1" {
  vpc_id            = data.aws_vpc.prod_vpc.id
  availability_zone = data.aws_availability_zones.working.names[2]
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name    = "Subnet_1 in ${data.aws_availability_zones.working.names[2]}"
    Account = "Subnet_1 in Account ${data.aws_caller_identity.current.account_id}"
    Region  = data.aws_region.current.description
  }
}

resource "aws_subnet" "prod_subnet_2" {
  vpc_id            = data.aws_vpc.prod_vpc.id
  availability_zone = data.aws_availability_zones.working.names[3]
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name    = "Subnet_2 in ${data.aws_availability_zones.working.names[3]}"
    Account = "Subnet_2 in Account ${data.aws_caller_identity.current.account_id}"
    Region  = data.aws_region.current.description
  }
}
