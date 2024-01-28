# Create VPC Module
module "vpc" {
  source = "../../modules/vpc"

  tag_environment = var.tag_environment
  tag_application = var.tag_application
  tag_stack       = var.tag_application
  cidr            = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.120.0.0/20", "10.120.16.0/20", "10.120.32.0/20"]
  public_subnets  = ["10.120.196.0/24", "10.120.197.0/24", "10.120.198.0/24"]

  # NAT GW
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  # VPN Gateway
  enable_vpn_gateway = false

  # DNS & DHCP
  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_dhcp_options = true

  # VPC Endpoints
  enable_s3_endpoint       = false
  enable_dynamodb_endpoint = false

  # Specific Tags
  private_subnet_tags = {
    role = "privateSubnet"
  }

  public_subnet_tags = {
    role = "publicSubnet"
  }

  private_route_table_tags = {
    role = "privateRouteTable"
  }

  public_route_table_tags = {
    role = "publicRouteTable"
  }

  nat_gateway_tags = {
    role = "natGateway"
  }

  nat_eip_tags = {
    role = "natEip"
  }

  igw_tags = {
    role = "internetGateway"
  }

  vpn_gateway_tags = {
    role = "vpnGateway"
  }
  vpc_tags = {
    role = "vpc"
  }

  # General Tags
  tags = {
    environment = var.tag_environment
  }
}