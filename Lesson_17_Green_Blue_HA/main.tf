#----------------------------------------------------------
# Provision Highly Availabe Web in any Region Default VPC
# Create:
#    - Security Group for Web Server and ALB
#    - Launch Template with Auto AMI Lookup
#    - Auto Scaling Group using 2 Availability Zones
#    - Application Load Balancer in 2 Availability Zones
#    - Application Load Balancer TargetGroup
# Update to Web Servers will be via Green/Blue Deployment Strategy
# Made by Sergei Chesnokov 07-March-2024
#-----------------------------------------------------------

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Owner     = "Sergei Chesnokov"
      CreatedBy = "Terraform"
      Course    = "From Zero to Certified Professional"
    }
  }
}



#-------------------------------------------------------------------------------
resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.working.names[0]
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = data.aws_availability_zones.working.names[1]
}
